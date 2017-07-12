require 'spec_helper'

describe Bxm do
  it 'has a version number' do
    expect(Bxm::VERSION).not_to be nil
    puts Bxm::VERSION
  end

  it 'I am able to generate a 500 random secure keys' do
    puts "ENGLISH - default !!!!!!!!!!!!"
    list_psw=[]
    for x in 1..500
      i=0
      result = Bxm::Password.rand_key(4).to_s
      expect(list_psw.to_s).to_not match(result)
      list_psw<<result
      puts "Random bxm key is #{result}"
      end
    end

  it 'I am able to generate a 50 random secure keys in spanish' do
    puts "SPANISH !!!!!!!!!!!!"
    list_psw=[]
    for x in 1..50
      i=0
      result = Bxm::Password.rand_key(4,'palabras').to_s
      expect(list_psw.to_s).to_not match(result)
      list_psw<<result
      puts "Random bxm key is #{result}"
    end
  end

  it 'I am able to generate a 50 random secure keys in german' do
    puts "GERMAN !!!!!!!!!!!!"
    list_psw=[]
    for x in 1..50
      i=0
      result = Bxm::Password.rand_key(4,'worts').to_s
      expect(list_psw.to_s).to_not match(result)
      list_psw<<result
      puts "Random bxm key is #{result}"
    end
  end

  it 'I am able to generate a password 10 levels deep' do
    puts "English !!!!!!!!!!!!"
    list_psw=[]
      result = Bxm::Password.rand_key(10,'words').to_s
      puts "Random bxm key is #{result}"
  end

  it 'I am able to generate a password with special character' do
    puts "Special Characters !!!!!!!!!!!!"
    list_psw=[]
    result = Bxm::Password.rand_key(5,'words',true).to_s
    puts "Random bxm key is #{result}"
  end

end
