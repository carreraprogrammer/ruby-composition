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