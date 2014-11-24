require 'test_helper'

describe Fanforce::Base::Utils do

  it 'should return true if false, nil, or empty' do
    assert Fanforce.is_blank?(nil) == true
    assert Fanforce.is_blank?('') == true
    assert Fanforce.is_blank?([]) == true
    assert Fanforce.is_blank?({}) == true
    assert Fanforce.is_blank?(false) == true

    assert Fanforce.is_blank?(true) == false
    assert Fanforce.is_blank?(0) == false
    assert Fanforce.is_blank?(1) == false
    assert Fanforce.is_blank?('SOMETHING') == false
  end

  it 'should return true if not blank' do
    assert Fanforce.is_present?(nil) == false
    assert Fanforce.is_present?('') == false
    assert Fanforce.is_present?([]) == false
    assert Fanforce.is_present?({}) == false
    assert Fanforce.is_present?(false) == false

    assert Fanforce.is_present?(true) == true
    assert Fanforce.is_present?(0) == true
    assert Fanforce.is_present?(1) == true
    assert Fanforce.is_present?('SOMETHING') == true
  end

  it 'should symbolize all keys' do
    Fanforce.symbolize_keys({'first' => 'test', 'second' => 2}).each do |k,v|
      assert k.is_a?(Symbol)
    end
    Fanforce.symbolize_keys([{'first' => 'test', 'second' => 2}]).each do |hash|
      hash.each do |k,v|
        assert k.is_a?(Symbol)
      end
    end
  end

end
