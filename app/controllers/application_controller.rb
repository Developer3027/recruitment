class ApplicationController < ActionController::Base
  before_action :set_metadata
  def set_metadata
    set_meta_tags site: "TRUCKERJOBS4U.com",
                  title: "TRUCKERJOBS4U.com",
                  description: "TruckerJobs4u.com is a recruiting service for trucker drivers looking to find top quality CDL, Class A, driving jobs. A recruiting service that focuses on delivering professional customer service to the truck driver. Upshift your career with TRUCKERJOBS4U.com.",
                  type: "website",
                  url: "https://truckerjobs4u.com",
                  og: {
                    title: "TRUCKERJOBS4U.com",
                    description: "TruckerJobs4u.com is a recruiting service for trucker drivers looking to find top quality CDL, Class A, driving jobs. A recruiting service that focuses on delivering professional customer service to the truck driver. Upshift your career with TRUCKERJOBS4U.com.",
                    type: "website",
                    url: "https://truckerjobs4u.com",
                    image: "https://blog3169.s3.us-east-2.amazonaws.com/hero.png",
                    image_alt: "Big rig hauling down the interstate",
                    site: "TRUCKERJOBS4U.com"
                  }
  end
end
