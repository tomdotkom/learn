class Medevlp < ActiveRecord::Base
	MAX_VALUE = 1000000000000
	attr_accessible :memo, :content, :devtim, :title, :directory, :file, :file1, :file2
  
	has_many :devdetails
    def file
  
  end
  def file=(file)
    add_file(file)
  end
  def file1
  end
  def file1=(file)
    add_file(file)
  end
  def file2
  end
  def file2=(file)
    add_file(file)
  end
  def add_file(file)
  	#return if file.length == 0
  	dir = read_attribute(:directory)|| new_directory
  	File.open("#{fullpath(dir)}/#{file.original_filename}",'wb') do |f|
  		f.write(file.read)
  	end
  end
  def files
  	Dir.entries(fullpath(read_attribute(:directory))).reject do |ent|
  		ent[0..0] == '.' || ent[-3,3] == 'zip'
  	end
  end
  def sources
  	Dir.entries(fullpath(read_attribute(:directory))).reject do |ent|
  		ent[0..0] == '.' || ent[-3,3] != 'zip'
  	end
  end
  def destroy
  	files.each do |file|
  		File.delete("#{fullpath(read_attribute(:directory))}/#{file}")
  	end
  	Dir.delete(fullpath(read_attribute(:directory)))
  	super
  end
  def new_directory
  	begin
  		dir = rand(MAX_VALUE).to_s
  		Dir.mkdir(fullpath(dir))
  		write_attribute(:directory, dir)
  	rescue Errno::EEXIST
  		dir = nil
  	end until dir
  	dir
  end
  def fullpath(dir)
  	"public/action/#{dir}"
  end

end
