# ADD CLIENT

module MovieFacts
    class Client
      def initialize(driver, depaginator)
        @driver = driver
        @depaginator = depaginator
      end
  
      def directors
        fetch_data("/directors").map { |director| Director.new(director) }
      end
  
      def director(name)
        Director.new(fetch_data("/directors/#{name}"))
      end
  
      private
  
      def fetch_data(path)
        @depaginator.depaginate @driver.fetch_data(path)
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
    class Depaginator
      def depaginate(data)
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