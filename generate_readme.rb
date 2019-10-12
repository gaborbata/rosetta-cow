#!/usr/bin/env ruby

LANG_DATA = {
  lua: {
    name: "Lua",
    version: "Lua 5.3.5"
  },
  rb: {
    name: "Ruby",
    version: "ruby 2.5.1p57"
  },
  java: {
    name: "Java",
    version: "openjdk 11.0.3"
  },
  js: {
    name: "JavaScript",
    version: "node v8.10.0"
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
    version: "Python 2.7.15rc1"
  },
  pas: {
    name: "Pascal",
    version: "Free Pascal Compiler version 3.0.4"
  }
}

readme_contents = ''
readme_file = File.open('README.md', 'r:UTF-8')
readme_file.each_line do |line|
  readme_contents += line
  break if line.start_with?('## Solutions')
end
readme_file.close

readme_contents += "\n"

Dir.glob('solutions/*').sort_by { |file_name| file_name.downcase }.each do |file_name|
  extension = file_name.split('.').last
  name = LANG_DATA[extension.to_sym][:name]
  version = LANG_DATA[extension.to_sym][:version]
  readme_contents += "<details><summary>#{name}</summary>\n\n"
  readme_contents += "```#{extension}\n"
  readme_contents += File.read(file_name)
  readme_contents += "```\n\n"
  readme_contents += "> Implemented using: #{version}\n"
  readme_contents += "</details>\n\n"
end

readme_file = File.open('README.md', 'w:UTF-8')
readme_file.puts readme_contents
readme_file.close
