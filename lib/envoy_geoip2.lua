local mm = require('maxminddb')
local db = mm.open('/mnt/maxmind/GeoIP2-City.mmdb')

local M = {}

function M.get_country(ip_addr)
    local ok, res = pcall(db.lookup, db, ip_addr)
    if not ok or not res then
        return nil
    end

    return res:get('country', 'iso_code')
end

function envoy_on_request(request_handle)
    local xff = request_handle:headers():get('x-forwarded-for')
    local ip = string.gmatch(xff, "([^,]+)")()
    local country = M.get_country(ip)

    if country then
        request_handle:headers():add('x-country', country)
    end
end
function envoy_on_response(response_handle) end

return M
