ENCRYPTION_KEY="c2f06891d31f25664ce6e70cd6b8e0c8"
class String
  def aes_encrypt
   result = ActiveRecord::Base.connection.execute("select aes_encrypt('#{Mysql2::Client.escape(self)}', '#{::ENCRYPTION_KEY}')")
   if result.first
     result.first[0]
   else
     self
   end
  end

  def aes_decrypt
   result = ActiveRecord::Base.connection.execute("select aes_decrypt('#{Mysql2::Client.escape(self)}', '#{::ENCRYPTION_KEY}') ")
   if result.first
    result.first[0]
   else
     self
   end
  end
end
