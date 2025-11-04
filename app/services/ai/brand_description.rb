# app/services/ai/brand_description.rb
module Ai
  class BrandDescription
    def self.generate(brand)
      client = OpenAI::Client.new(
        access_token: ENV.fetch("GROQ_API_KEY"),
        uri_base: "https://api.groq.com/openai"
      )

      response = client.chat(
        parameters: {
          model: "llama-3.1-8b-instant",
          messages: [ { role: "user", content: "Write a short description about this #{brand} if none is provided. Usually it's going to be computer hardware brands, so give a small overview about it, like 250 characters saying good things about it" } ],
          temperature: 0.7
        }
      )

      response.dig("choices", 0, "message", "content")
    end
  end
end
