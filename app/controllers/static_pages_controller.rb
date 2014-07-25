class StaticPagesController < ApplicationController
  def home
    
    @currentPage = {:home => "active"};
  end

  def calendar
    @currentPage = {:calendar => "active"};
  end

  def resources
    @currentPage = {:resources => "active"};
  end

  def jobs
    @currentPage = {:jobs => "active"};
  end

  def contact
    @currentPage = {:contact => "active"};
  end
end
