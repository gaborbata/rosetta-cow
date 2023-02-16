#!/usr/bin/env ruby

LANG_DATA = {
  sh: {
    name: "Bash",
    version: "GNU bash, version 5.0.7"
  },
  lua: {
    name: "Lua",
    version: "Lua 5.3.3"
  },
  rb: {
    name: "Ruby",
    version: "ruby 2.5.1p57"
  },
  java: {
    name: "Java",
    version: "openjdk version 17.0.4"
  },
  js: {
    name: "JavaScript",
    version: "Node.js v8.10.0"
  },
  io: {
    name: "Io",
    version: "Io Programming Language, v. 20110905"
  },
  go: {
    name: "Go (Golang)",
    version: "go version go1.13"
  },
  groovy: {
    name: "Groovy",
    version: "Groovy Version: 2.5.8"
  },
  py: {
    name: "Python",
    version: "Python 2.7.15+"
  },
  pas: {
    name: "Pascal",
    version: "Free Pascal Compiler version 3.0.4"
  },
  c: {
    name: "C",
    version: "gcc (GCC) 7.4.0"
  },
  ts: {
    name: "TypeScript",
    version: "ts-node v8.6.2"
  },
  gb: {
    name: "Goby",
    version: "goby 0.1.13"
  },
  rs: {
    name: "Rust",
    version: "rustc 1.65.0"
  },
  php: {
    name: "PHP",
    version: "PHP 8.0.0 (cli)"
  },
  kt: {
    name: "Kotlin",
    version: "Kotlin version 1.5.0-release-749"
  },
  vbs: {
    name: "VBScript",
    version: "Microsoft (R) Windows Script Host Version 5.812"
  },
  ps1: {
    name: "PowerShell",
    version: "PowerShell version 5.1.19041.906"
  },
  jl: {
    name: "Julia",
    version: "julia version 1.6.3"
  },
  scala: {
    name: "Scala",
    version: "ChatGPT Feb 13 Version"
  },
  nim: {
    name: "Nim",
    version: "ChatGPT Feb 13 Version"
  },
  lol: {
    name: "LOLCODE",
    version: "ChatGPT Feb 13 Version"
  }
}

readme_contents = ''
readme_file = File.open('README.md', 'r:UTF-8')
readme_file.each_line do |line|
  readme_contents += line
  break if line.start_with?('## Solutions')
end
readme_file.close

readme_contents = readme_contents.gsub("\r\n", "\n").gsub("\r", "\n") + "\n"

Dir.glob('solutions/*').sort_by { |file_name| file_name.downcase }.each do |file_name|
  extension = file_name.split('.').last
  name = LANG_DATA[extension.to_sym][:name]
  version = LANG_DATA[extension.to_sym][:version]
  readme_contents += "<details><summary>#{name}</summary>\n\n"
  readme_contents += "```#{extension}\n"
  readme_contents += File.read(file_name).gsub("\r\n", "\n").gsub("\r", "\n")
  readme_contents += "```\n\n"
  readme_contents += "> Implemented using: #{version}\n"
  readme_contents += "</details>\n\n"
end

readme_file = File.open('README.md', 'w:UTF-8')
readme_file.puts readme_contents
readme_file.close
