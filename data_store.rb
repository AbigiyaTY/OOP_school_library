require 'json'

class DataStore
    def initialize(file_name)
        @file_name = "#{file_name}.json"
        write([]) unless File.file?(@file_name)
    end

    def write(data)
        writeData = JSON.generate(data)
        File.write(@file_name, writeData)
    end

    def read
        readData = File.read(@file_name)
        JSON.parse(readData)
    end
end
