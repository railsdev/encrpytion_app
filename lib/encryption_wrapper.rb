class EncryptionWrapper

  def before_save(record)
    record.message = encrypt(record.message) 
  end


  private
    def encrypt(value)
      value.aes_encrypt
    end

    def decrypt(value)
      value.aes_decrypt
    end
end
