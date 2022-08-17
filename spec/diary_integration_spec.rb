require "diary"
require "diary_entry"

RSpec.describe "integration of *Diary* class and *Diary Entries* class" do
    context "First we need to create a Diary" do
        it "will try and test different options in the Diary" do
            # Create a new Diary
            bootcamp_diary = Diary.new 
            #Check behaviour when empty
            expect(bootcamp_diary.all).to eq "The diary has no entries."
            #Create and add entry 01
            entry_01 = DiaryEntry.new("Day 01 - 25 July 2022", "We had a first meeting with our employer, OpenBet. Then we met the coaches and the rest of the colleagues.")
            expect(entry_01.contents).to eq "We had a first meeting with our employer, OpenBet. Then we met the coaches and the rest of the colleagues."
            bootcamp_diary.add(entry_01)
            #Create and add entry 02
            entry_02 = DiaryEntry.new("Day 02 - 26 July 2022", "We had a first meeting with my peer group, Adrian and Britanni. They really seem to be nice people.")
            expect(entry_02.contents).to eq "We had a first meeting with my peer group, Adrian and Britanni. They really seem to be nice people."
            bootcamp_diary.add(entry_02)
            #Create and add entry 03
            entry_03 = DiaryEntry.new("Day 03 - 27 July 2022", "We started to learn and work on our new exercises and challenges")
            expect(entry_03.contents).to eq "We started to learn and work on our new exercises and challenges"
            bootcamp_diary.add(entry_03)
            #Count words for entry_01 and entry02
            expect(entry_01.count_words).to eq 20
            expect(entry_02.count_words).to eq 19
            expect(entry_03.count_words).to eq 12
            #Get the average time to read entry01, entry02 and entry03 with different wpm's
            expect(entry_01.reading_time(5)).to eq 4
            expect(entry_01.reading_time(10)).to eq 2
            expect(entry_01.reading_time(20)).to eq 1
            expect(entry_02.reading_time(5)).to eq 4
            expect(entry_02.reading_time(13)).to eq 2
            expect(entry_02.reading_time(20)).to eq 1
            expect(entry_03.reading_time(5)).to eq 3
            expect(entry_03.reading_time(13)).to eq 1
            expect(entry_03.reading_time(9)).to eq 2
            #Lets test the reading chunks
            expect(entry_01.reading_chunk(10,1)).to eq "We had a first meeting with our employer, OpenBet. Then"
            expect(entry_01.reading_chunk(10,1)).to eq "we met the coaches and the rest of the colleagues."
            expect(entry_01.reading_chunk(10,1)).to eq "We had a first meeting with our employer, OpenBet. Then"
            expect(entry_02.reading_chunk(15,1)).to eq "We had a first meeting with my peer group, Adrian and Britanni. They really seem"
            expect(entry_02.reading_chunk(15,1)).to eq "to be nice people."
            expect(entry_02.reading_chunk(15,1)).to eq "We had a first meeting with my peer group, Adrian and Britanni. They really seem"
            expect(entry_03.reading_chunk(1,2)).to eq "We started"
            expect(entry_03.reading_chunk(2,2)).to eq "to learn and work"
            expect(entry_03.reading_chunk(10,2)).to eq "on our new exercises and challenges"
            expect(entry_03.reading_chunk(5,2)).to eq "We started to learn and work on our new exercises"
            #Count words
            expect(bootcamp_diary.count_words).to eq 51
            entry_04 = DiaryEntry.new("Day 04 - 28 July 2022", "This entry is just to add some more words and test the behaviour of the program we are coding")
            expect(entry_04.count_words).to eq 19
            bootcamp_diary.add(entry_04)
            expect(bootcamp_diary.count_words).to eq 70
            #Reading time (all)
            expect(bootcamp_diary.reading_time(1)).to eq 70
            expect(bootcamp_diary.reading_time(2)).to eq 35
            expect(bootcamp_diary.reading_time(3)).to eq 24
            expect(bootcamp_diary.reading_time(10)).to eq 7
            expect(bootcamp_diary.reading_time(100)).to eq 1
            #Best entry for reading time
            expect(bootcamp_diary.find_best_entry_for_reading_time(20,1)).to eq entry_01
            expect(bootcamp_diary.find_best_entry_for_reading_time(7,2)).to eq entry_03
            expect(bootcamp_diary.find_best_entry_for_reading_time(2,2)).to eq "No entry match for the time available, all the entries require more time to read"
        end
    end
end