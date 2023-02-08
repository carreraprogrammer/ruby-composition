# ADD CLIENT

module MovieFacts
    class Client
      def initialize(driver)
        @driver = driver # may or may not be decorated with a depaginator
      end
  
      def directors
        @driver.fetch_data("/directors").map { |director| Director.new(director) }
      end
  
      def director(name)
        Director.new(@driver.fetch_data("/directors/#{name}"))
      end
    end
  end
  # DRIVER 

  module MovieFacts
    class HttpDriver
      def fetch_data
        # fetch data over HTTP
        # cache results
      end
    end
  end

  module MovieFacts
    class CacheDriver
      def fetch_data
        # read data from cache
      end
    end
  end

# DEPAGINATOR

module MovieFacts
    class Depaginator < SimpleDelegator
      def fetch_data(path)
        data = __get_obj__.fetch_data(path)
        # depaginate the data
      end
    end
  end

  
  module MovieFacts
    class NoopDepaginator
      def depaginate(data)
        data # just return the data without de-paginating it
      end
    end
  end