describe Language do

  it { should have_and_belong_to_many(:dvds) }

  describe 'title validation' do
    context 'title is present' do
      before(:each) do
        @lang = Language.new(title: 'Italian')
      end

      it 'is valid with present title' do
        expect(@lang).to have(0).errors_on(:title)
      end

      it 'is invalid with duplicate title' do
        Language.create(title: 'Lithuanian')
        duplicate = Language.new(title: 'Lithuanian')
        expect(duplicate).to have(1).errors_on(:title)
      end

      it 'is invalid with duplicate case sensitive title' do
        Language.create(title: 'Lithuanian')
        duplicate = Language.new(title: 'liThuAniaN')
        expect(duplicate).to have(1).errors_on(:title)
      end

      it 'returns full title' do
        expect(@lang.title).to eq 'Italian'
      end
    end

    context 'title is not present' do
      before(:each) do
        @lang = Language.new
      end

      it 'has an error on title attribute' do
        expect(@lang).to have(1).errors_on(:title)
      end

    end
  end
end