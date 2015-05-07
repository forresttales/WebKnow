# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(50)       default("")
#  username               :string(50)
#  password_digest        :string(255)
#  remember_token         :string(255)
#  has_account            :boolean          default(FALSE)
#  name_first             :string(50)
#  name_last              :string(50)
#  bd_day                 :integer          default(0)
#  bd_month               :integer          default(0)
#  bd_year                :integer          default(0)
#  gender                 :integer          default(0)
#  bd_month_text          :string(255)
#  gender_text            :string(255)
#  auth_token             :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  avatar                 :string(255)
#  id_gen                 :integer          default(0)
#  id_per                 :string(255)      default("")
#  slug                   :string(200)
#  avatar_image           :string(255)
#  slug_pre_id            :string(255)
#  id_per_b               :boolean          default(FALSE)
#  profile_type           :integer          default(0)
#  profile_type_text      :string(255)
#  new_user               :boolean          default(TRUE)
#

class PublicUser < User
    
end
