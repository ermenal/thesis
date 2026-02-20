#!/usr/bin/env python3
import argparse
from pathlib import Path


def bytes_to_c_initializer_macro(data: bytes) -> str:
    if not data:
        return " \\\n{ \\\n  0x00 \\\n}"

    parts = [f"0x{value:02X}" for value in data]
    lines = []
    line = []
    for idx, token in enumerate(parts, start=1):
        line.append(token)
        if (idx % 16) == 0:
            lines.append(", ".join(line))
            line = []
    if line:
        lines.append(", ".join(line))

    body_lines = ["{ \\"]
    for line_idx, data_line in enumerate(lines):
        if line_idx == len(lines) - 1:
            body_lines.append(f"  {data_line} \\")
        else:
            body_lines.append(f"  {data_line}, \\")
    body_lines.append("}")

    return " \\\n" + "\n".join(body_lines)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--secure-bin", type=Path, default=None)
    parser.add_argument("--nonsecure-bin", type=Path, default=None)
    parser.add_argument("--out", type=Path, default=Path("ota_server_images.h"))
    args = parser.parse_args()

    secure_bytes = b""
    nonsecure_bytes = b""

    if args.secure_bin is not None:
        secure_bytes = args.secure_bin.read_bytes()
    if args.nonsecure_bin is not None:
        nonsecure_bytes = args.nonsecure_bin.read_bytes()

    content = "\n".join([
        "#ifndef OTA_SERVER_IMAGES_H",
        "#define OTA_SERVER_IMAGES_H",
        "",
        f"#define OTA_SERVER_SECURE_IMAGE_SIZE ({len(secure_bytes)}u)",
        f"#define OTA_SERVER_NONSECURE_IMAGE_SIZE ({len(nonsecure_bytes)}u)",
        "",
        "#define OTA_SERVER_SECURE_IMAGE_DATA" + bytes_to_c_initializer_macro(secure_bytes),
        "",
        "#define OTA_SERVER_NONSECURE_IMAGE_DATA" + bytes_to_c_initializer_macro(nonsecure_bytes),
        "",
        "#endif",
        "",
    ])

    args.out.write_text(content)


if __name__ == "__main__":
    main()
