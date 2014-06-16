describe Genre do

  it { should have_and_belong_to_many(:dvds) }

  describe 'title validation' do
    context 'title is present' do
      before(:each) do
        @genre = Genre.new(title: 'Drama')
      end

      it 'is valid with present title' do
        expect(@genre).to have(0).errors_on(:title)
      end

      it 'is invalid with duplicate title' do
        Genre.create(title: 'Science fiction')
        duplicate = Genre.new(title: 'Science fiction')
        expect(duplicate).to have(1).errors_on(:title)
      end

      it 'is invalid with duplicate case sensitive title' do
        Genre.create(title: 'Science Fiction')
        duplicate = Genre.new(title: 'science fiCtiOn')
        expect(duplicate).to have(1).errors_on(:title)
      end

      it 'returns full title' do
        expect(@genre.title).to eq 'Drama'
      end

    end

    context 'title is not present' do
      before(:each) do
        @genre = Genre.new
      end

      it 'has an error on title attribute' do
        expect(@genre).to have(1).errors_on(:title)
      end

    end
  end
end