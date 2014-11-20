class ConversationMsg < ActiveRecord::Base
  before_save      EncryptionWrapper.new
 
  def message
    if persisted?
      self[:message].aes_decrypt
    else
      self[:message]
    end
  end

  # For searching use below query
  #
  # SELECT id, cast(AES_DECRYPT(message, 'c2f06891d31f25664ce6e70cd6b8e0c8') as char)
  # FROM conversation_msgs 
  # WHERE INSTR(AES_DECRYPT(message, 'c2f06891d31f25664ce6e70cd6b8e0c8'), 'awesome') 

end
