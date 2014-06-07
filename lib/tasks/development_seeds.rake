if Rails.env.development?
  require 'factory_girl'

  namespace :dev do
    desc 'Seed data for development environment'
    task prime: 'db:setup' do
      # FactoryGirl.find_definitions
      include FactoryGirl::Syntax::Methods

      create(:payment_service, name: "BitCoin", code: "coin", app_id: "")
      create(:payment_service, name: "BitPay", code: "bpay", app_id: "")
      create(:payment_service, name: "Cumberland Farms", code: "cfrm", app_id: "")
      create(:payment_service, name: "Dunkin' Donuts", code: "dnkn", app_id: "")
      create(:payment_service, name: "Leaf", code: "leaf", app_id: "")
      create(:payment_service, name: "LevelUp", code: "lvup", app_id: "")
      create(:payment_service, name: "PayPal", code: "ppal", app_id: "")
      create(:payment_service, name: "Starbucks", code: "sbux", app_id: "")

      StarbucksDataLoader.new("development").load
      DunkinDonutsDataLoader.new("development").load
      CumberlandFarmsDataLoader.new("development").load
      LevelUpDataLoader.new("development").load

    end
  end
end

class LevelUpDataLoader
  def initialize(environment)
    @environment = environment
    @payment_service = PaymentService.level_up
  end

  def load
    puts "Loading #{@payment_service.name} retailers ..."

    location_json_file = File.read("db/data/levelup_locations.json")
    levelup_locations = JSON.parse(location_json_file)

    categories_json_file = File.read("db/data/levelup_categories.json")
    levelup_categories = JSON.parse(categories_json_file)

    levelup_categories_hash = {}
    levelup_categories.each do |levelup_category|
      id = levelup_category['category']['id']
      name = levelup_category['category']['name']
      levelup_categories_hash[id] = name
    end

    levelup_locations.each do |location_item|
      location = location_item['location']

      services = []

      if location['merchant_name']

        categories = location['categories'] || []

        categories.each do |category_id|
          services << levelup_categories_hash[category_id]
        end

        retailer_attributes = {
                                store_number: location['id'],
                                name: strip(location['merchant_name']),
                                services: services,
                                latitude: location['latitude'].to_f,
                                longitude: location['longitude'].to_f,
                                payment_service: @payment_service
                              }

        Retailer.create(retailer_attributes)

      end
    end

    puts "Done!"
  end

  def strip(value)
    if value
      value.strip
    else
      ""
    end
  end
end

class StarbucksDataLoader
  def initialize(environment)
    @environment = environment
    @payment_service = PaymentService.starbucks
  end

  def load
    puts "Loading #{@payment_service.name} retailers ..."

    CSV.foreach("db/data/starbucks_05-09-14.csv", :headers => true) do |row|
      services = row['Services'] || ""
      retailer_attributes = {
                              store_number: strip(row['Store Number']),
                              name: strip(row['Store Location']),
                              address: strip("#{strip(row['Address'])} #{strip(row['Address Line 2'])} #{strip(row['Address Line 3'])}"),
                              city: strip(row['City']),
                              state: strip(row['State']),
                              zip_code: strip(row['Zip Code']),
                              phone_number: strip(row['Phone Number']),
                              store_hours: strip(row['Store Hours']),
                              services: services.split(' | '),
                              latitude: row['Latitude'].to_f,
                              longitude: row['Longitude'].to_f,
                              payment_service: @payment_service
                            }

      Retailer.create(retailer_attributes)
    end
    puts "Done!"
  end

  def strip(value)
    if value
      value.strip
    else
      ""
    end
  end
end

class DunkinDonutsDataLoader
  def initialize(environment)
    @environment = environment
    @payment_service = PaymentService.dunkin_donuts
  end

  def load
    puts "Loading #{@payment_service.name} retailers ..."

    CSV.foreach("db/data/dunkindonuts_2.csv", :headers => true) do |row|
      services = if row['Drive Thru'] == 'Y'
                  ['Drive Thru']
                else
                  []
                end
      retailer_attributes = {
                              store_number: strip(row['Store Number']),
                              name: strip(row['Store Name']),
                              address: strip("#{strip(row['Address'])} #{strip(row['Address Line 2'])}"),
                              city: strip(row['City']),
                              state: strip(row['State']),
                              zip_code: strip(row['Zip Code']),
                              phone_number: strip(row['Phone Number']),
                              phone_number: strip(row['Fax Number']),
                              store_hours: strip(row['Store Hours']),
                              services: services,
                              latitude: row['Latitude'].to_f,
                              longitude: row['Longitude'].to_f,
                              payment_service: @payment_service
                            }

      Retailer.create(retailer_attributes)
    end
    puts "Done!"
  end

  def strip(value)
    if value
      value.strip
    else
      ""
    end
  end
end

class CumberlandFarmsDataLoader
  def initialize(environment)
    @environment = environment
    @payment_service = PaymentService.cumberland_farms
  end

  def load
    puts "Loading #{@payment_service.name} retailers ..."

    CSV.foreach("db/data/cumberland_farms_03-31-14.csv", :headers => true) do |row|

      services = []

      if row['Gas'] == 'TRUE'
        services << 'Gas'
      end

      if row['Diesel'] == 'TRUE'
        services << 'Diesel'
      end


      retailer_attributes = {
                              store_number: strip(row['Store Number']),
                              name: "Cumberland Farms",
                              address: strip("#{strip(row['Address'])}"),
                              city: strip(row['City']),
                              state: strip(row['State']),
                              zip_code: strip(row['Zip Code']),
                              phone_number: strip(row['Phone Number']),
                              store_hours: strip(row['Store Hours']),
                              services: services,
                              latitude: row['Latitude'].to_f,
                              longitude: row['Longitude'].to_f,
                              payment_service: @payment_service
                            }

      Retailer.create(retailer_attributes)
    end
    puts "Done!"
  end

  def strip(value)
    if value
      value.strip
    else
      ""
    end
  end
end
