<?xml version="1.0" encoding="UTF-8"?>
<!-- ***** BEGIN LICENSE BLOCK *****
   - Version: MPL 1.1/GPL 2.0/LGPL 2.1
   -
   - The contents of this file are subject to the Mozilla Public License Version
   - 1.1 (the "License"); you may not use this file except in compliance with
   - the License. You may obtain a copy of the License at
   - http://www.mozilla.org/MPL/
   -
   - Software distributed under the License is distributed on an "AS IS" basis,
   - WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
   - for the specific language governing rights and limitations under the
   - License.
   -
   - The Original Code is part of dcm4che, an implementation of DICOM(TM) in
   - Java(TM), hosted at https://github.com/gunterze/dcm4che.
   -
   - The Initial Developer of the Original Code is
   - Agfa Healthcare.
   - Portions created by the Initial Developer are Copyright (C) 2011
   - the Initial Developer. All Rights Reserved.
   -
   - Contributor(s):
   - Gunter Zeilinger <gunterze@gmail.com>
   - Hesham Elbadawi <bsdreko@gmail.com>
   -
   - Alternatively, the contents of this file may be used under the terms of
   - either the GNU General Public License Version 2 or later (the "GPL"), or
   - the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
   - in which case the provisions of the GPL or the LGPL are applicable instead
   - of those above. If you wish to allow use of your version of this file only
   - under the terms of either the GPL or the LGPL, and not to allow others to
   - use your version of this file under the terms of the MPL, indicate your
   - decision by deleting the provisions above and replace them with the notice
   - and other provisions required by the GPL or the LGPL. If you do not delete
   - the provisions above, a recipient may use your version of this file under
   - the terms of any one of the MPL, the GPL or the LGPL.
   -
   - ***** END LICENSE BLOCK *****  -->

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"></xsl:output>
  <xsl:template match="elements">
      <xsl:text>/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is part of dcm4che, an implementation of DICOM(TM) in
 * Java(TM), hosted at https://github.com/gunterze/dcm4che.
 *
 * The Initial Developer of the Original Code is
 * Agfa Healthcare.
 * Portions created by the Initial Developer are Copyright (C) 2011
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 * See @authors listed below
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK *****
 * This file is generated from Part 6 and 7 of the Standard Text Edition 2011.
 */
 
 /**
 * @author Gunter Zeilinger &lt;gunterze@gmail.com&gt;
 * @author Hesham Elbadawi  &lt;bsdreko@gmail.com&gt;
 */
 
 </xsl:text>
var DCM4CHE = DCM4CHE || {};

DCM4CHE.elementDictionary = (function (dictionary) {
    var tables = [dictionary],
        mask = function(tag, privateCreator) {
            return privateCreator
                ? tag.slice(0,4) + "xx" + tag.slice(6)
                : ((tag.substr(0,2) == "50" <![CDATA[&]]><![CDATA[&]]> tag.charAt(3)%2==0) ||
                  (tag.substr(0,2) == "60" <![CDATA[&]]><![CDATA[&]]> tag.charAt(3)%2==0) ||
                (tag.substr(0,2) == "7F" <![CDATA[&]]><![CDATA[&]]> tag.substr(0,3)!="7FE")||
                tag.substr(0,2) == "10" )?tag.substr(0,2) + "xx" + tag.slice(4):tag;
        },
        groupLengthOrPrivateCreator = function (tag, privateCreator) {
            if(tag.substr(4,4) === "0000"){
                return "gggg0000";
            }
            else if(tag.charAt(3)%2 !== 0 <![CDATA[&]]><![CDATA[&]]> tag.substr(4,2) === "00")
            {
                return "pppp0000";
            }
            return mask(tag,privateCreator);
        }
        ,
        lookup = function(type, tag, privateCreator) {
            var i = tables.length, value;
            tag = groupLengthOrPrivateCreator(tag,privateCreator);
            if((tag ==="gggg0000" || tag ==="pppp0000"))
                privateCreator=undefined;

            while (i--) {
                if (privateCreator === tables[i].privateCreator) {
                    value = tables[i][tag][type];
                    if (value)
                        return value;
                }
            }

            return "?";
        }
    return {
        addTables: function (table) {
            tables.push(table);
        },
        lookup:lookup
    }
}({"gggg0000":{"VR": "UL" ,  "VM": "1" ,  "keyword": "GroupLength"},
    "pppp0000":{"VR": "LO" ,  "VM": "1" ,  "keyword": "PrivateCreator"},
  <xsl:apply-templates select="element"/>
  <xsl-text disable-output-escaping="yes">
</xsl-text>
  </xsl:template>  
  <xsl:template match="element">
    <xsl:text>"</xsl:text>
    <xsl:value-of select="@tag" />
    <xsl:text>": { </xsl:text>
    <xsl:text> "vr": "</xsl:text>
    <xsl:value-of select="@vr" />
    <xsl:text>" , </xsl:text>
    <xsl:text> "keyword": "</xsl:text>
    <xsl:value-of select="@keyword" />
    <xsl:text>" }</xsl:text>
    <xsl:choose>
    <xsl:when test="position()=last()">
    <xsl:text>}));</xsl:text>
    </xsl:when>
    <xsl:otherwise>
    <xsl:text> , </xsl:text>
    </xsl:otherwise>
</xsl:choose>
<xsl:text>
</xsl:text>
  </xsl:template>
</xsl:stylesheet>