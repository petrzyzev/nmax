# frozen_string_literal: true

require 'nmax'

RSpec.describe 'Nmax' do
  let(:io) { StringIO.new(text) }
  let(:text) do
    '123test321test test333tEst111
		99999999_example
		100000000
		1 2 5'
  end
  let(:n) { 2 }

  it 'returns `n` max numbers of string' do
    expect(Nmax::Finder.new(io, n).run).to eq([99_999_999, 100_000_000])
  end
end
