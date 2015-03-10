
key = Key.new.key_generator
oc = OffsetCalc.new.last_four_digits_of_squared_date
encrypted = Rotator.encrypt(key, oc, "this is a secret message, do not tell anyone about it. if you do you will face serious consequences. you will have to attend turing for 7 months.")
encrypted
decrypted = Rotator.decrypt(key, oc, encrypted)


key = Key.new.key_generator


oc = OffsetCalc.new
oc.last_four_digits_of_squared_date