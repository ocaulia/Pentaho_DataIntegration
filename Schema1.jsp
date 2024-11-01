<%@ page import="java.io.*, javax.xml.parsers.*, org.w3c.dom.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Display Cube Schema</title>
</head>
<body>

<%
    // Sample XML content representing the schema
    String xmlContent = "<Schema name=\"New Schema1\">\n" +
                        "  <Cube name=\"FactTable\" visible=\"true\" cache=\"true\" enabled=\"true\">\n" +
                        "    <Table name=\"FactTable\">\n" +
                        "    </Table>\n" +
                        "    <Dimension type=\"StandardDimension\" visible=\"true\" foreignKey=\"IDTransaksi\" name=\"DIM_Transaksi\">\n" +
                        "    </Dimension>\n" +
                        "    <Dimension type=\"StandardDimension\" visible=\"true\" foreignKey=\"IdCustomer\" name=\"DIM_Customer\">\n" +
                        "    </Dimension>\n" +
                        "    <Dimension type=\"StandardDimension\" visible=\"true\" foreignKey=\"idTime\" name=\"DIM_Time\">\n" +
                        "    </Dimension>\n" +
                        "    <Dimension type=\"StandardDimension\" visible=\"true\" foreignKey=\"IdFurniture\" name=\"DIM_furniture\">\n" +
                        "    </Dimension>\n" +
                        "    <Dimension type=\"StandardDimension\" visible=\"true\" foreignKey=\"IDLokasi\" name=\"DIM_Lokasi\">\n" +
                        "    </Dimension>\n" +
                        "  </Cube>\n" +
                        "</Schema>";

    try {
        // Parsing the XML content
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        InputSource is = new InputSource(new StringReader(xmlContent));
        Document doc = builder.parse(is);

        // Getting information from the XML elements
        NodeList cubeList = doc.getElementsByTagName("Cube");
        for (int i = 0; i < cubeList.getLength(); i++) {
            Node cubeNode = cubeList.item(i);
            if (cubeNode.getNodeType() == Node.ELEMENT_NODE) {
                Element cubeElement = (Element) cubeNode;
                String cubeName = cubeElement.getAttribute("name");
                out.println("<h2>Cube Name: " + cubeName + "</h2>");

                NodeList dimensionList = cubeElement.getElementsByTagName("Dimension");
                out.println("<ul>");
                for (int j = 0; j < dimensionList.getLength(); j++) {
                    Node dimensionNode = dimensionList.item(j);
                    if (dimensionNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element dimensionElement = (Element) dimensionNode;
                        String dimensionName = dimensionElement.getAttribute("name");
                        out.println("<li>Dimension Name: " + dimensionName + "</li>");
                    }
                }
                out.println("</ul>");
            }
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</body>
</html>
