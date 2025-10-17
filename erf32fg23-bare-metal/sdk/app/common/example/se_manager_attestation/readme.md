# SE Manager Attestation

This example uses the SE Manager API to fetch attestation tokens on the supported Series 2 device.

The example also contains code that demonstrates how the tokens can be parsed and printed in a human-readable format.
Parsing and printing of tokens on the actual device might not be a strictly typical use case, but it is nevertheless included in order to showcase the structure and capabilities of the supported attestation tokens.

An attestation token is a token that contains cryptographically signed claims about the device.
In other words, it provides a way to securely attest certain device information, such as the serial number, security configuration and other information about the state of the device.
An attestation token provided by the SE Manager API is a COSE_Sign1 structure that encapsulates the signed CBOR Web Token containing the claims.

The example redirects standard I/O to the virtual serial port (VCOM) of the kit. By default, the serial port setting is 115200 bps and 8-N-1 configuration.

The example has been instrumented with code to count the number of clock cycles spent in different operations. The results are printed on the VCOM serial port console. This feature can be disabled by defining `SE_MANAGER_PRINT=0` (default is 1) in the IDE setting (`Preprocessor->Defined symbols`).

## Getting Started

1. Upgrade the kit’s firmware to the latest version (see `Adapter Firmware` under [General Device Information](https://docs.silabs.com/simplicity-studio-5-users-guide/latest/ss-5-users-guide-about-the-launcher/welcome-and-device-tabs#general-device-information) in the Simplicity Studio 5 User's Guide).
2. Upgrade the device’s SE firmware to the latest version (see `Secure Firmware` under [General Device Information](https://docs.silabs.com/simplicity-studio-5-users-guide/latest/ss-5-users-guide-about-the-launcher/welcome-and-device-tabs#general-device-information) in the Simplicity Studio 5 User's Guide).
3. Open any terminal program and connect to the kit’s VCOM port (if using `Device Console` in Simplicity Studio 5, `Line terminator:` must be set to `None`).
4. Create this platform example project in the Simplicity IDE (see [Examples](https://docs.silabs.com/simplicity-studio-5-users-guide/latest/ss-5-users-guide-getting-started/start-a-project#examples) in the Simplicity Studio 5 User's Guide).
5. Build the example and download it to the kit (see [Simple Build](https://docs.silabs.com/simplicity-studio-5-users-guide/latest/ss-5-users-guide-building-and-flashing/building#simple-build) and [Flash Programmer](https://docs.silabs.com/simplicity-studio-5-users-guide/latest/ss-5-users-guide-building-and-flashing/flashing#flash-programmer) in the Simplicity Studio 5 User's Guide).
6. Run the example and follow the instructions shown on the console.

## Additional Information 

### SE Manager API

The following SE Manager APIs are used in this example:

* `sl_se_init`
* `sl_se_deinit`
* `sl_se_init_command_context`
* `sl_se_deinit_command_context`
* `sl_se_get_random`   
* `sl_se_attestation_get_psa_iat_token`   
* `sl_se_attestation_get_config_token` 

## Troubleshooting

### Serial Port Settings

Be sure to select the following settings to see the serial output of this example:

* 115200 Baud Rate 
* 8-N-1 configuration
* Line terminator should be set to "None" if using Device Console in Simplicity Studio

### Programming the Radio Board

Before programming the radio board mounted on the mainboard, make sure the power supply switch is in the AEM position (right side) as shown below.

![Radio board power supply switch](image/readme_img0.png)

## Additional Information

1.  The HSE Secure Vault Mid devices require SE firmware v1.2.11 or higher (EFR32xG21) and v2.1.7 or higher (other HSE devices) to support hardware acceleration on `x25519` and `Ed25519`.
2.  The default optimization level is `Optimize for debugging (-Og)` on Simplicity IDE and `None` on IAR Embedded Workbench.

## Resources

[SE Manager API](https://docs.silabs.com/gecko-platform/latest/service/api/group-sl-se-manager)

## Report Bugs & Get Support

You are always encouraged and welcome to report any issues you found to us via [Silicon Labs Community](https://community.silabs.com/).