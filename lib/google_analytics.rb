module GoogleAnalytics
  include Radiant::Taggable


  desc "Creates Google Analytics with id content"
  tag "google_analytics" do |tag|
    type = tag.attr['type'] || 's' # single domain 's' OR with many subdomain 'm'
    domian = tag.attr['domain'] # required if type == 'm' // without www. just the name, example: thisisdomain.com
    script = %{<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
}

    if type == 's'
sub = %{<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("#{tag.attr['id']}");
pageTracker._trackPageview();
} catch(err) {}</script>}
    else
      if type == 'm'
sub = %{<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("#{tag.attr['id']}");
pageTracker._setDomainName(".#{tag.attr['domain']}");
pageTracker._trackPageview();
} catch(err) {}</script>}
      else
sub = %{<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("#{tag.attr['id']}");
pageTracker._setDomainName("none");
pageTracker._setAllowLinker(true);
pageTracker._trackPageview();
} catch(err) {}</script>}
      end
    end
    script + sub
  end
end
