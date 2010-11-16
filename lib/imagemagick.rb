def download_and_watermark(from_key, to_key)
  tempfile = Tempfile.new("original")
  output_path = "#{tempfile.path}.jpg"
  
  result = system(%Q[
    curl -s -o "#{output_path}" "http://assets.vintageaerial.com/#{from_key}" && 
    convert "#{output_path}" -resize 650x433! assets/watermark.png -gravity Center -composite -quality 90 "#{output_path}"
  ])
  
  if result
    if $s3.put('assets.vintageaerial.com', to_key, File.open(output_path), {"x-amz-acl" => "public-read"})
      return to_key
    else
      return nil
    end
  else
    return nil
  end
end