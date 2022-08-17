# File: lib/diary.rb
class Diary
    def initialize
        @diary_entries = []
        @total_words = 0
    end

    def add(entry) # entry is an instance of DiaryEntry
        @diary_entries << entry # Returns nothing
    end

    def all
        if @diary_entries != []
            return @diary_entries # Returns a list of instances of DiaryEntry
        else
            return "The diary has no entries."
        end
    end

    def count_words
        # Returns the number of words in all diary entries
        # HINT: This method should make use of the `count_words` method on DiaryEntry.
        @total_words = 0
        @diary_entries.each {|entry| @total_words += entry.count_words}
        return @total_words
        #si modifico tengo variable que me avisa, si no ha cambiado nada y lo llamo, me
        #da el mismo resultado anterior, si cambia algo, cuenta de nuevo
    end

    def reading_time(wpm)   # wpm is an integer representing
                            # the number of words the user can read per minute
        # Returns an integer representing an estimate of the reading time in minutes
        # if the user were to read all entries in the diary.
        return ((count_words.to_f)/(wpm.to_f)).ceil.to_i
    end
    def find_best_entry_for_reading_time(wpm, minutes)
            # `wpm` is an integer representing the number of words the user can read
            # per minute.
            # `minutes` is an integer representing the number of minutes the user
            # has to read.
        # Returns an instance of diary entry representing the entry that is closest 
        # to, but not over, the length that the user could read in the minutes they
        # have available given their reading speed.

        can_read = wpm * minutes #esto nos da las palabras que puede leer la persona

        # una entrada menor o igual que can_read
        # va actualizando y si es mayor que la que hay y menor o igual que can_read, sustituir
        # si pasa que las dos entradas son del mismo tamaño, ofrecer las distintas opciones

        aux_entry = DiaryEntry.new("","")
        #aux_list = [aux_entry]

        @diary_entries.each do |entry|
            if ((entry.count_words <= can_read) && (entry.count_words > aux_entry.count_words))
                aux_entry = entry
            end
        end

        if (aux_entry.title == "" && aux_entry.contents == "")
            return "No entry match for the time available, all the entries require more time to read"
        else
            return aux_entry
        end

        #mirar entradas mas pequeñas, si más grande decir que no hay ninguna pero la más proxima es
        # y dar la más aproximada
    end
end