# sshotpad - SSH One Time Pad

sshotpad is a simple tool that allows you to securely create a One Time SSH key while maintaining the benefits of conventional SSH. It enables you to initialize a One Time Pad (OTP) by typing `sshotpad`, and then use this OTP as a key to SSH exactly once. sshotpad automatically invalidates the OTP on usage and generates a new one, ensuring enhanced security.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Security Considerations](#security-considerations)
- [Contributing](#contributing)
- [License](#license)

## Installation

To install sshotpad, run the command

```bash
curl -sSL https://github.com/sahilnarain/sshotpad/blob/main/setup.sh | bash
```

## Usage

Once sshotpad is installed, you can initialize a One Time Pad by running:

```bash
sshotpad
```

This command will generate a new OTP and display it for you to use. You can then save the OTP for the next session. The OTP will automatically invalidate itself after usage, and a new OTP will be generated for a subsequent execution.

Please note that it's important to keep your OTP secret, as it is the key to your secure script execution.

## Security Considerations

When using sshotpad, it's important to consider the following security best practices:

1.  **Keep Your OTP Secret**: Treat your One Time Pad like a password. Do not share it or expose it to unauthorized individuals.

2.  **Use HTTPS**: Ensure that the script you are executing via `curl -sSL` is served over HTTPS to prevent man-in-the-middle attacks.

3.  **Regularly Update sshotpad**: Check for updates to sshotpad and keep your installation up to date to receive security improvements and bug fixes.

4.  **Monitor Execution**: Regularly review the logs and execution history of your scripts to detect any unusual activity.

## Contributing

If you find any issues, have feature requests, or want to contribute to sshotpad's development, please feel free to open an issue or create a pull request on [GitHub](https://github.com/sahilnarain/sshotpad).

## License

This project is licensed under the MIT License.
