#   start date: 2/10/2024 2/15/2023
#   end date:
#   timelog: ~~5:45 HRs
#   author: Joel Bos
#   desc: this is a weather application that allows the user to see their
#         local weather by entering an IP address.


class Weather 
    require 'httparty'
    require 'json'

    def main
        #get user inout
        puts "Please enter your IP address: "
        ip = gets.chomp

        #get result from ipapi.co
        ipapi_key = '9d184f306e4a698a8c4b7ae55792bc5f'
        response = HTTParty.get("http://api.ipapi.com/#{ip}?access_key=#{ipapi_key}")
        api_result = JSON.parse(response.body)

        #find long, lat and assign to variables
        latitude = api_result["latitude"]
        longitude = api_result["longitude"]

        #get result from openmeteo
        response = HTTParty.get("https://api.open-meteo.com/v1/forecast?latitude=#{latitude}&longitude=#{longitude}&hourly=temperature_2m&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch")
        weather_response = JSON.parse(response.body)
        temp_hourly = weather_response["hourly"]["temperature_2m"]

        #organized output of the hourly forecast for the next 7 days
        print("\nday 1:\t\t")
        (1..24).each do |hour|
            print("#{temp_hourly[hour]}, ")
        end
        print("\nday 2:\t\t")
        (25..48).each do |hour|
            print("#{temp_hourly[hour]}, ")
        end
        print("\nday 3:\t\t")
        (49..72).each do |hour|
            print("#{temp_hourly[hour]}, ")
        end
        print("\nday 4:\t\t")
        (73..96).each do |hour|
            print("#{temp_hourly[hour]}, ")
        end
        print("\nday 5:\t\t")
        (97..120).each do |hour|
            print("#{temp_hourly[hour]}, ")
        end
        print("\nday 6:\t\t")
        (121..144).each do |hour|
            print("#{temp_hourly[hour]}, ")
        end
        print("\nday 7:\t\t")
        (145..168).each do |hour|
            print("#{temp_hourly[hour]}, ")
        end
    end
end

#call the main method
if __FILE__ == $0
    wa = Weather.new

    wa.main
end

