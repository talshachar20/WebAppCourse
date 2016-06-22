class RedisStub
  def initialize
    @atoms = {}
  end

  def get(key)
    @atoms[key]
  end

  def set(key, value)
    @atoms[key.to_s] = value.to_s
    'OK'
  end
end

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create!
    $redis = RedisStub.new
  end

  test "get my cached info" do
    $redis.set("User/info/#{@user.id}", YAML.dump([1,2,3]))
    assert_equal([1,2,3], @user.get_cached_info)
  end
end