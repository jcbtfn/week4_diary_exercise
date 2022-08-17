# File: lib/diary_entry.rb
class DiaryEntry
    def initialize(title, contents) # title, contents are strings
        @title = title
        @contents = contents
        @chunk = 0
    end

    def title
        return @title.to_s # Returns the title as a string
    end

    def contents
        return @contents.to_s # Returns the contents as a string
    end

    def count_words
        return @contents.split.count # Returns the number of words in the contents as an integer
    end

    def reading_time(wpm)   # wpm is an integer representing
                            # the number of words the user can read per minute
        # Returns an integer representing an estimate of the reading time in minutes
        # for the contents at the given wpm.
        return ((@contents.split.count.to_f)/(wpm.to_f)).ceil.to_i
    end

    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
        # Returns a string with a chunk of the contents that the user could read
        # in the given number of minutes.
        # If called again, `reading_chunk` should return the next chunk, skipping
        # what has already been read, until the contents is fully read.
        # The next call after that it should restart from the beginning.
        if (@chunk >= @contents.split.length)
            @chunk = 0
        end
        #HAY QUE HACER UNA COMPROBACION PARA CUANDO EL NUMERO QUE TENGA SEA MAYOR
        #MAS ARRAY O CACHOS QUE LEER QUE PALABRAS PUEDO DEVOLVER PARA QUE NO SE PASE
        to_show = @contents.split[(0+@chunk)...(wpm*minutes+@chunk)].join(" ")
        @chunk += wpm*minutes
        #puts "Chunks + wpm*minutes: " + @chunk.to_s
        #puts to_show + " <--- termino aquí"
        #puts to_show.split.length
        return to_show
    end
end