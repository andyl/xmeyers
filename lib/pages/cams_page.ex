defmodule Xmeyers.CamsPage do
  use Tableau.Page, layout: Xmeyers.RootLayout, permalink: "/cams"
  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <div class="p-4 grid lg:grid-cols-4 sm:grid-cols-2 gap-4">
        <div class="col-md-6 text-center">
          <iframe
            class="cctv-webcam"
            frameborder="0"
            src="https://cwwp2.dot.ca.gov/vm/loc/d3/hwy50atwrightslake1.htm"
          >
          </iframe>
        </div>
        <div class="col-md-6 text-center">
          <iframe
            class="cctv-webcam"
            frameborder="0"
            src="https://cwwp2.dot.ca.gov/vm/loc/d3/hwy50attwinbridges.htm"
          >
          </iframe>
        </div>
        <div class="col-md-6 text-center">
          <iframe
            class="cctv-webcam"
            frameborder="0"
            src="https://cwwp2.dot.ca.gov/vm/loc/d3/hwy50atsierraeb.htm"
          >
          </iframe>
        </div>
        <div class="col-md-6 text-center">
          <iframe
            class="cctv-webcam"
            frameborder="0"
            src="https://cwwp2.dot.ca.gov/vm/loc/d3/hwy50atechosummit.htm"
          >
          </iframe>
        </div>
        <div class="col-md-6 text-center">
          <iframe
            class="cctv-webcam"
            frameborder="0"
            src="https://cwwp2.dot.ca.gov/vm/loc/d3/hwy50atmeyers.htm"
          >
          </iframe>
        </div>
        <div class="col-md-6 text-center">
          <iframe
            class="cctv-webcam"
            frameborder="0"
            src="https://cwwp2.dot.ca.gov/vm/loc/d3/pioneertrailed50eb1.htm"
          >
          </iframe>
        </div>
        <div class="col-md-6 text-center">
          <iframe
            class="cctv-webcam"
            frameborder="0"
            src="https://cwwp2.dot.ca.gov/vm/loc/d3/pioneertrailed50eb2.htm"
          >
          </iframe>
        </div>
        <div class="col-md-6 text-center">
          <iframe
            class="cctv-webcam"
            frameborder="0"
            src="https://cwwp2.dot.ca.gov/vm/loc/d3/hwy50athwy89.htm"
          >
          </iframe>
        </div>
    </div>
    """
  end
end
