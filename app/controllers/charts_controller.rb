class ChartsController < ApplicationController
  
      helper_method :executesql, :executesqlarray, :encrypt, :min_semester, :decrypt, :max_semester

  def index
    @course = Course.find(current_user.course_id)
   	@blocks = @course.blocks
    @users = current_user
    @events_users = @users.events_users
  end
  

  def sumevent(block)
  	sumevent = 0
  		block.events.each do |event|
  			sumevent += event.users.count
  		end
  end
   

  def block_users
  	sumblock = 0
  	@blocks.each do |block|
  		
  		sumblock += sumevent(block)
  	return sumblock
  	end
  end

end
