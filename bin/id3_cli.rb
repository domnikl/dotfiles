require "mini_readline"
require 'colorize'

class CLI
  def run(path)
    @paths = Dir.glob("#{path}/*.mp3")
    @index = 0

    run_edit_loop()
  end

  def run_edit_loop()
    while @index < @paths.length
      @current = Mp3File.load(@paths[@index])

      puts_file_info()
      action = gets_action()

      if action == "q"
        exit(0)
      elsif action == "a"
        @current.artist = MiniReadline.readline('new artist: ', false, initial: @current.artist.strip)
        @current.save
      elsif action == "t"
        @current.title = MiniReadline.readline('new title: ', false, initial: @current.title.strip)
        @current.save
      elsif action == "s"
        @current.title = @current.title
        @current.artist = @current.artist
        @current.save
      elsif action == "j"
        artist = @current.artist
        @current.artist = @current.title
        @current.title = artist
        @current.save
      elsif action == "m"
        begin
          @index += 1
          @current = Mp3File.load(@paths[@index])
        end while @current.artist_saved? and @current.title_saved? and @index < @paths.length - 1
      elsif action == ""
        @index += 1
      else
        STDERR.puts "ERROR: Unknown command '#{action}'"
        sleep 2
      end
    end
  end

  def puts_file_info()
    title = @current.title
    artist = @current.artist

    unless @current.title_saved?
      title = @current.title.colorize(:green)
    end

    unless @current.artist_saved?
      artist = @current.artist.colorize(:green)
    end
    
    puts "\e[H\e[2J"
    print "#{@index + 1}/#{@paths.length} ".colorize(:light_blue)
    puts "#{@current.filename}".colorize(:blue)
    puts "#{"t".colorize(:yellow)}itle: #{title}"
    puts "#{"a".colorize(:yellow)}rtist: #{artist}"
    puts ""
  end
  
  def gets_action()
    puts "choose action: ".colorize(:blue)
    puts "  m - move to next one without tags"
    puts "  t - edit title"
    puts "  a - edit artist"
    puts "  j - switch artist & title"
    puts "  q - exit without saving"
    puts "  s - save suggestions"
    puts "  <Enter> - next "
    gets.chomp()
  end  
end
