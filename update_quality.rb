require_relative 'award'

def update_quality(awards)

  awards.each do |award|

    if award.name != 'Blue First' && award.name != 'Blue Compare' && award.name != 'Blue Star'
      if award.name != 'Blue Distinction Plus' && award.quality > 0
        award.quality -= 1
      end
    else
      if award.quality < 50
        award.quality += 1

        if award.name == 'Blue Compare'

          if award.expires_in < 11
            if award.quality < 50
              award.quality += 1
            end
          end

          if award.expires_in < 6
            if award.quality < 50
              award.quality += 1
            end
          end

        end

      end
      
    end

    if award.name != 'Blue Distinction Plus'
      award.expires_in -= 1
    end

    if award.expires_in < 0
      if award.name != 'Blue First'
        if award.name != 'Blue Compare'
          if award.quality > 0
            if award.name != 'Blue Distinction Plus'
              award.quality -= 1
            end
          end
        else
          award.quality = award.quality - award.quality
        end
      else
        if award.quality < 50
          award.quality += 1
        end
      end
    end



  end

end

award = Award.new("Blue First", 5, 10)
p award
p award.quality
update_quality([award])
p award.quality
