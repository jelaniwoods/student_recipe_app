namespace :fix do
  desc "TODO"
  task photos: :environment do
    require "csv"
    require "open-uri"

    csv_text = File.read(Rails.root.join("public", "recipes.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      r = Recipe.find(row["id"])
      next if r.image.present?
      URI.open(row["image"]) do |f|
        r.image = f
      end
      r.save
      puts "#{Recipe.where(image: nil).count} recipes left"
    end

  end

end
