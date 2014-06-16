describe User do
  it { should have_many(:rentals).dependent(:destroy)}
  it { should have_many(:dvds).through(:rentals) }

  describe 'creation' do
    context 'valid attributes' do
      it 'should be valid' do
        user = User.new(
            name: 'John',
            surname: 'Bull',
            email: 'john.bull@village.com',
            phone: '+37068381200',
            address: 'Petunijaus str.20-15, Kansas, US'
        )
        expect(user).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'should not be valid' do
        user = User.new(name: 'John')
        expect(user).to be_invalid
      end
    end
  end

  describe 'email validation' do

    context 'email valid' do
      before(:each) do
        @user = User.new(
            name: 'John',
            surname: 'Bull',
            email: 'john.bull@village.com',
            phone: '+37068381200',
            address: 'Petunijaus str.20-15, Kansas, US'
        )
      end

      it 'is valid with present email' do
        expect(@user).to have(0).errors_on(:email)
      end

      it 'returns email address' do
        expect(@user.email).to eq 'john.bull@village.com'
      end

      it 'is invalid with duplicate email' do
        user = User.create(
            name: 'John',
            surname: 'Bull',
            email: 'something@somewhere.com',
            phone: '+37068381200',
            address: 'Petunijaus str.20-15, Kansas, US'
        )

        duplicate = User.new(
            name: 'John',
            surname: 'Bull',
            email: 'something@somewhere.com',
            phone: '+37068381200',
            address: 'Petunijaus str.20-15, Kansas, US'
        )

        expect(duplicate).to have(1).errors_on(:email)
      end

      it 'is invalid with duplicate case sensitive email' do
        user = User.create(
            name: 'John',
            surname: 'Bull',
            email: 'vytautas@vytautas.com',
            phone: '+37068381200',
            address: 'Petunijaus str.20-15, Kansas, US'
        )

        duplicate = User.new(
            name: 'John',
            surname: 'Bull',
            email: 'VYTAUTAS@vytautaS.com',
            phone: '+37068381200',
            address: 'Petunijaus str.20-15, Kansas, US'
        )

        expect(duplicate).to have(1).errors_on(:email)
      end

    end

    context 'email not valid' do
      before(:each) do
        @user = User.new(
            name: 'John',
            surname: 'Bull',
            email: 'john.bull@.com',
            phone: '+37068381200',
            address: 'Petunijaus str.20-15, Kansas, US'
        )
      end

      it 'has an error on email attribute' do
        expect(@user).to have(1).errors_on(:email)
      end

    end

  end

end