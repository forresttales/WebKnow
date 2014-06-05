module PublisherJournalpostersHelper

    def yn(x)
      if x == 1
        return "Yes"
      else
        return "No"
      end
    end

    def tf(x)
      if x == true
        return "Yes"
      else
        return "No"
      end
    end

end
