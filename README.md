# Clojure and Leiningen Installation Script

This script automates the installation process of Clojure and Leiningen, the popular tools for Clojure development. It provides support for macOS (both Intel and M1 chips), Linux (Debian-based and Fedora-based), and Windows (both 32-bit and 64-bit) platforms. The script detects the current environment and installs the appropriate versions of Clojure and Leiningen accordingly.

## Usage as a Shell Script

1. Open a terminal and navigate to the directory containing `clo.rb`.

```bash
chmod +x clo.rb
```

2. Execute the script with the following command:
```bash
./clo.rb
```

## Usage as a Ruby Script

1. Open a terminal and navigate to the directory containing `clo.rb`.

```bash
ruby clo.rb
```

The script will automatically detect your system architecture and operating system and install Ruby, Clojure and Leiningen accordingly.

## Note
- The script may prompt for administrative privileges on macOS and Linux during package installation.
- The script may prompt for administrative privileges on Windows if Chocolatey is not already installed.

## License
This script is open-source and available under the MIT License. You can find the full license in the `LICENSE` file.

## Acknowledgments
This script was created to provide a smooth and hassle-free installation experience for Clojure developers on different platforms.

## Author

[Webster Avosa](https://github.com/avosa)

Enjoy!