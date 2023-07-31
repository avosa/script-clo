#!/usr/bin/env ruby

def execute_command(command)
    puts "Executing: #{command}"
    output = `#{command}`
    status = $?.exitstatus
    [output, status]
  end
  
  def install_homebrew
    return if system('command -v brew >/dev/null 2>&1')
  
    puts "Installing Homebrew..."
    execute_command('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
  end
  
  def install_clojure
    case RbConfig::CONFIG['host_os']
    when /darwin/
      case RbConfig::CONFIG['host_cpu']
      when /x86_64/
        install_homebrew
        unless system('command -v clojure >/dev/null 2>&1')
          puts "Installing Clojure..."
          output, status = execute_command('brew install clojure')
          puts output unless status.zero?
        else
          puts "Clojure is already installed."
        end
      when /arm64/
        install_homebrew
        unless system('command -v clojure >/dev/null 2>&1')
          puts "Installing Clojure..."
          output, status = execute_command('brew install clojure')
          puts output unless status.zero?
        else
          puts "Clojure is already installed."
        end
      else
        puts "Unsupported architecture: #{RbConfig::CONFIG['host_cpu']}. Cannot install Clojure."
        exit(1)
      end
    when /linux-gnu/
      if system('command -v apt-get >/dev/null 2>&1')
        unless system('command -v clojure >/dev/null 2>&1')
          puts "Updating package list..."
          execute_command('sudo apt-get update')
  
          puts "Installing Clojure..."
          output, status = execute_command('sudo apt-get install -y clojure')
          puts output unless status.zero?
        else
          puts "Clojure is already installed."
        end
      elsif system('command -v dnf >/dev/null 2>&1')
        unless system('command -v clojure >/dev/null 2>&1')
          puts "Installing Clojure..."
          output, status = execute_command('sudo dnf install -y clojure')
          puts output unless status.zero?
        else
          puts "Clojure is already installed."
        end
      else
        puts "Unsupported Linux distribution. Cannot install Clojure."
        exit(1)
      end
    when /mswin|mingw|cygwin/
      unless system('command -v clojure >/dev/null 2>&1')
        puts "Installing Clojure..."
        output, status = execute_command('choco install clojure')
        puts output unless status.zero?
      else
        puts "Clojure is already installed."
      end
    else
      puts "Unsupported OS: #{RbConfig::CONFIG['host_os']}. Cannot install Clojure."
      exit(1)
    end
  end
  
  def install_leiningen
    case RbConfig::CONFIG['host_os']
    when /darwin/
      case RbConfig::CONFIG['host_cpu']
      when /x86_64/
        install_homebrew
        unless system('command -v lein >/dev/null 2>&1')
          puts "Installing Leiningen..."
          output, status = execute_command('brew install leiningen')
          puts output unless status.zero?
        else
          puts "Leiningen is already installed."
        end
      when /arm64/
        install_homebrew
        unless system('command -v lein >/dev/null 2>&1')
          puts "Installing Leiningen..."
          output, status = execute_command('brew install leiningen')
          puts output unless status.zero?
        else
          puts "Leiningen is already installed."
        end
      else
        puts "Unsupported architecture: #{RbConfig::CONFIG['host_cpu']}. Cannot install Leiningen."
        exit(1)
      end
    when /linux-gnu/
      if system('command -v apt-get >/dev/null 2>&1')
        unless system('command -v lein >/dev/null 2>&1')
          puts "Updating package list..."
          execute_command('sudo apt-get update')
  
          puts "Installing Leiningen..."
          output, status = execute_command('sudo apt-get install -y leiningen')
          puts output unless status.zero?
        else
          puts "Leiningen is already installed."
        end
      elsif system('command -v dnf >/dev/null 2>&1')
        unless system('command -v lein >/dev/null 2>&1')
          puts "Installing Leiningen..."
          output, status = execute_command('sudo dnf install -y leiningen')
          puts output unless status.zero?
        else
          puts "Leiningen is already installed."
        end
      else
        puts "Unsupported Linux distribution. Cannot install Leiningen."
        exit(1)
      end
    when /mswin|mingw|cygwin/
      unless system('command -v lein >/dev/null 2>&1')
        puts "Installing Leiningen..."
        output, status = execute_command('choco install leiningen')
        puts output unless status.zero?
      else
        puts "Leiningen is already installed."
      end
    else
      puts "Unsupported OS: #{RbConfig::CONFIG['host_os']}. Cannot install Leiningen."
      exit(1)
    end
  end
  
  def main
    install_clojure
    install_leiningen
  
    puts "Installation complete!"
  end
  
  main
  