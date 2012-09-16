class CucumberMonitorController < ApplicationController

	layout 'cucumber_monitor'

  def features
    @features = CucumberMonitor.new.features
  end

  def show_feature
    @feature = CucumberMonitor.new.features.where(name: params[:name])
  end

  def search
    features = CucumberMonitor.new.features.where(name: params[:criteria])
    @features_search_results = features.kind_of?(Array) ? features : [features]
    @steps_search_results = CucumberMonitor.new.search(params[:criteria])
  end

end