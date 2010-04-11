require File.dirname(__FILE__) + '/../spec_helper'

describe 'GoogleAnalytics' do
  dataset :pages
  
  describe '<r:google_analytics>' do

    it 'should render the correct HTML' do
      tag = '<r:google_analytics id="ID" />'
      
      expected = %{<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("ID");
pageTracker._trackPageview();
} catch(err) {}</script>}

      pages(:home).should render(tag).as(expected)
    end
    
    it 'should render the correct HTML' do
      tag = '<r:google_analytics id="ID" type="m" domain="i.com" />'
      
      expected = %{<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("ID");
pageTracker._setDomainName(".i.com");
pageTracker._trackPageview();
} catch(err) {}</script>}

      pages(:home).should render(tag).as(expected)
    end
    
    it 'should render the correct HTML' do
      tag = '<r:google_analytics id="ID" type="ml" />'
      
      expected = %{<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("ID");
pageTracker._setDomainName("none");
pageTracker._setAllowLinker(true);
pageTracker._trackPageview();
} catch(err) {}</script>}

      pages(:home).should render(tag).as(expected)
    end

  end
end
