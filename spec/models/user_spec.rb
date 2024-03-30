require 'rails_helper'
describe User do
 before do
  @user = FactoryBot.build(:user)
 end

 describe 'ユーザー新規登録' do
  context '新規登録がうまくいくとき' do
    it 'nicknameとemail、passwordとpassword_confirmationとfirstname_とlastnameとfirstname_kanaとlastname_kanaとbirthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordが6文字以上であれば登録できる' do
      @user.password = 'aaa000'
      @user.password_confirmation = 'aaa000'
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが同じなら登録できる' do
      @user.password = @user.password_confirmation
      expect(@user).to be_valid
    end
  end

  context '新規登録がうまくいかないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@が含まれていなければ登録できない' do
      @user.email = 'aaaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = 'aaa00'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordに半角英字がなければ登録できない' do
      @user.password = '000000'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordに半角数字がなければ登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it '全角を含むパスワードでは登録できない' do
      @user.password = 'ＡＡＡＡＡＡ'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationが一致しなければ登録できない' do
      @user.password = 'aaa000'
      @user.password_confirmation = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'firstnameが存在しなければ登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid")
    end
    it 'lastnameが存在しなければ登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid")
    end
    it 'firstname_kanaが存在しなければ登録できない' do
      @user.firstname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana is invalid")
    end
    it 'lastname_kataが存在しなければ登録できない' do
      @user.lastname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana is invalid")
    end
    it 'firstnameが全角入力でなければ登録できない' do
      @user.firstname = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname is invalid')
    end
    it 'lastnameが全角入力でなければ登録できない' do
      @user.lastname = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Lastname is invalid')
    end
    it 'firstname_kanaが全角カタカナ入力でなければ登録できない' do
      @user.firstname_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname kana is invalid')
    end
    it 'lastname_kanaが全角カタカナ入力でなければ登録できない' do
      @user.lastname_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Lastname kana is invalid')
    end
    it 'birthdayが存在しなければ登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
end
