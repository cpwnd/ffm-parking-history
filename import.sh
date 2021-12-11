# TODO this could also be imported via class definitions from remote namespace

git-history file ffm-parking.db parkdaten_dyn.xml --convert 'tree = xml.etree.ElementTree.fromstring(content)
areas = []
facilities = []
# TODO don t skip whole batch, when attribute error is invoked
try:
    areas = [{"id": el.find("{http://datex2.eu/schema/2/2_0}parkingAreaReference").get("id"),\
          "type": "area",\
         "statusTime": el.find("{http://datex2.eu/schema/2/2_0}parkingAreaStatusTime").text,\
         "occupancy": el.find("{http://datex2.eu/schema/2/2_0}parkingAreaOccupancy").text,\
         "totalParkingCapacityLongTermOverride": el.find("{http://datex2.eu/schema/2/2_0}totalParkingCapacityLongTermOverride").text,\
         "totalParkingCapacityShortTermOverride": el.find("{http://datex2.eu/schema/2/2_0}totalParkingCapacityShortTermOverride").text,\
         "vacant":el.find("{http://datex2.eu/schema/2/2_0}parkingAreaTotalNumberOfVacantParkingSpaces").text}\
       for el in tree[1][3][0].findall("{http://datex2.eu/schema/2/2_0}parkingAreaStatus")]

    facilities = [{"id": el.find("{http://datex2.eu/schema/2/2_0}parkingFacilityReference").get("id"), \
         "type": "facility", \
         "statusTime": el.find("{http://datex2.eu/schema/2/2_0}parkingFacilityStatusTime").text, \
         "occupancy": el.find("{http://datex2.eu/schema/2/2_0}parkingFacilityOccupancy").text, \
         "totalNumberOfOccupiedParkingSpaces": el.find("{http://datex2.eu/schema/2/2_0}totalNumberOfOccupiedParkingSpaces").text, \
         "totalParkingCapacityLongTermOverride": el.find("{http://datex2.eu/schema/2/2_0}totalParkingCapacityLongTermOverride").text, \
         "totalParkingCapacityShortTermOverride": el.find("{http://datex2.eu/schema/2/2_0}totalParkingCapacityShortTermOverride").text, \
         "vacant":el.find("{http://datex2.eu/schema/2/2_0}totalNumberOfVacantParkingSpaces").text} \
       for el in tree[1][3][0].findall("{http://datex2.eu/schema/2/2_0}parkingFacilityStatus")]
except AttributeError as e:
    print(e)

return areas + facilities
' --id id --id type --import xml.etree.ElementTree
