class StaticPagesController < ApplicationController
  def home
    
    @currentPage = {:home => "active"};
  end

  def developer
    @currentPage = {:developer => "active"};
  end

  def entrepreneur
    @currentPage = {:entrepreneur => "active"};
  end

  def jobs
    @currentPage = {:jobs => "active"};
  end

  def contact
    @currentPage = {:contact => "active"};
  end
end
