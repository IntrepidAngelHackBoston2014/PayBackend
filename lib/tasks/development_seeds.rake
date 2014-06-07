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
    end
  end
end

class StarbucksDataLoader
  def initialize(environment)
    @environment = environment
    @payment_service = PaymentService.starbucks
  end

  def load
    CSV.foreach("db/data/starbucks_05-09-14.csv", :headers => true) do |row|
      services = row['Services'] || ""
      retailer_attributes = {
                              store_number: row['Store Number'],
                              name: row['Store Location'],
                              address: "#{row['Address']} #{row['Address Line 2']} #{row['Address Line 3']}",
                              city: row['City'],
                              state: row['State'],
                              zip_code: row['Zip Code'],
                              phone_number: row['Phone Number'],
                              store_hours: row['Store Hours'],
                              services: services.split(' | '),
                              latitude: row['Latitude'].to_f,
                              longitude: row['Longitude'].to_f,
                              payment_service: @payment_service
                            }

      Retailer.create(retailer_attributes)
    end
  end
end
