require 'docx'

class FileCreator
  def initialize(file_path)
    @file_path = file_path
  end

  def generate
    # Read the document
    file_name = @file_path
    file_path = "public/uploads/copy/attachment/2/#{file_name}"
    # Write a new document line by line.
    #File.foreach(file_path) { |line| puts line }
    doc = Docx::Document.open(file_path)
    File.open("log.html", "w") {
      |f| doc.paragraphs.each do |p|
        f.write p.to_html
      end
    }
  end
end