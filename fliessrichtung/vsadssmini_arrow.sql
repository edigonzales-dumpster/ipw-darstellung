CREATE SCHEMA IF NOT EXISTS vsadssmini_arrow;
CREATE SEQUENCE vsadssmini_arrow.t_ili2db_seq;;
-- SIA405_Base_Abwasser_LV95.Administration.Organisation
CREATE TABLE vsadssmini_arrow.administration_organisation (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,bemerkung varchar(255) NULL
  ,bezeichnung varchar(255) NULL
  ,gemeindenummer integer NULL
  ,kurzbezeichnung varchar(12) NULL
  ,organisationstyp varchar(255) NULL
  ,astatus varchar(255) NULL
  ,auid varchar(12) NULL
  ,letzte_aenderung date NULL
)
;
-- VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil
CREATE TABLE vsadssmini_arrow.vsadssmini_rohrprofil (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,bemerkung varchar(80) NULL
  ,bezeichnung varchar(20) NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
)
;
-- VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie
CREATE TABLE vsadssmini_arrow.vsadssmini_rohrprofil_geometrie (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,reihenfolge integer NULL
  ,x decimal(12,4) NULL
  ,y decimal(12,4) NULL
  ,rohrprofilref bigint NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
)
;
-- VSADSSMINI_2020_LV95.VSADSSMini.Knoten
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,ara_nr integer NULL
  ,baujahr integer NULL
  ,baulicherzustand varchar(255) NULL
  ,bemerkung varchar(80) NULL
  ,bezeichnung varchar(41) NULL
  ,deckelkote decimal(7,3) NULL
  ,detailgeometrie geometry(POLYGON,2056) NULL
  ,dimension1 integer NULL
  ,dimension2 integer NULL
  ,finanzierung varchar(255) NULL
  ,funktion varchar(255) NULL
  ,funktionhierarchisch varchar(255) NULL
  ,lage geometry(POINT,2056) NULL
  ,lagegenauigkeit varchar(255) NULL
  ,nutzungsart_geplant varchar(255) NULL
  ,nutzungsart_ist varchar(255) NULL
  ,obj_id_abwasserbauwerk varchar(16) NULL
  ,obj_id_deckel varchar(16) NULL
  ,rueckstaukote_ist decimal(7,3) NULL
  ,sanierungsbedarf varchar(255) NULL
  ,sohlenkote decimal(7,3) NULL
  ,astatus varchar(255) NULL
  ,symbolori decimal(4,1) NULL
  ,zugaenglichkeit varchar(255) NULL
  ,zustandserhebung_jahr integer NULL
  ,betreiberref bigint NULL
  ,eigentuemerref bigint NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
)
;
CREATE INDEX vsadssmini_knoten_detailgeometrie_idx ON vsadssmini_arrow.vsadssmini_knoten USING GIST ( detailgeometrie );
CREATE INDEX vsadssmini_knoten_lage_idx ON vsadssmini_arrow.vsadssmini_knoten USING GIST ( lage );
-- VSADSSMINI_2020_LV95.VSADSSMini.Knoten_Text
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten_text (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,knotenref bigint NULL
  ,plantyp varchar(255) NULL
  ,textinhalt text NULL
  ,bemerkung varchar(80) NULL
  ,textpos geometry(POINT,2056) NULL
  ,textori decimal(4,1) NULL
  ,texthali varchar(255) NULL
  ,textvali varchar(255) NULL
)
;
CREATE INDEX vsadssmini_knoten_text_textpos_idx ON vsadssmini_arrow.vsadssmini_knoten_text USING GIST ( textpos );
-- VSADSSMINI_2020_LV95.VSADSSMini.Leitung
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,baujahr integer NULL
  ,baulicherzustand varchar(255) NULL
  ,bemerkung varchar(80) NULL
  ,bezeichnung varchar(41) NULL
  ,finanzierung varchar(255) NULL
  ,funktionhierarchisch varchar(255) NULL
  ,funktionhydraulisch varchar(255) NULL
  ,hoehengenauigkeit_nach varchar(255) NULL
  ,hoehengenauigkeit_von varchar(255) NULL
  ,hydr_belastung_ist decimal(5,2) NULL
  ,kote_nach decimal(7,3) NULL
  ,kote_von decimal(7,3) NULL
  ,laengeeffektiv decimal(7,2) NULL
  ,lagebestimmung varchar(255) NULL
  ,leckschutz varchar(255) NULL
  ,lichte_breite integer NULL
  ,lichte_hoehe integer NULL
  ,material varchar(255) NULL
  ,nutzungsart_geplant varchar(255) NULL
  ,nutzungsart_ist varchar(255) NULL
  ,obj_id_abwasserbauwerk varchar(16) NULL
  ,obj_id_nachhaltungspunkt varchar(16) NULL
  ,obj_id_vonhaltungspunkt varchar(16) NULL
  ,profiltyp varchar(255) NULL
  ,reliner_art varchar(255) NULL
  ,reliner_nennweite integer NULL
  ,sanierungsbedarf varchar(255) NULL
  ,astatus varchar(255) NULL
  ,verlauf geometry(LINESTRING,2056) NULL
  ,wandrauhigkeit decimal(5,2) NULL
  ,wbw_basisjahr integer NULL
  ,wbw_bauart varchar(255) NULL
  ,wiederbeschaffungswert decimal(10,2) NULL
  ,zustandserhebung_jahr integer NULL
  ,betreiberref bigint NULL
  ,eigentuemerref bigint NULL
  ,knoten_nachref bigint NULL
  ,knoten_vonref bigint NULL
  ,leitung_nachref bigint NULL
  ,rohrprofilref bigint NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
)
;
CREATE INDEX vsadssmini_leitung_verlauf_idx ON vsadssmini_arrow.vsadssmini_leitung USING GIST ( verlauf );
-- VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Text
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_text (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,leitungref bigint NULL
  ,plantyp varchar(255) NULL
  ,textinhalt text NULL
  ,bemerkung varchar(80) NULL
  ,textpos geometry(POINT,2056) NULL
  ,textori decimal(4,1) NULL
  ,texthali varchar(255) NULL
  ,textvali varchar(255) NULL
)
;
CREATE INDEX vsadssmini_leitung_text_textpos_idx ON vsadssmini_arrow.vsadssmini_leitung_text USING GIST ( textpos );
-- VSADSSMINI_2020_LV95.VSADSSMini.SK
CREATE TABLE vsadssmini_arrow.vsadssmini_sk (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Type varchar(60) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,akten varchar(255) NULL
  ,bemerkung varchar(80) NULL
  ,informationsquelle varchar(255) NULL
  ,sachbearbeiter varchar(50) NULL
  ,standortname varchar(50) NULL
  ,steuerung_fernwirkung varchar(255) NULL
  ,wbw_basisjahr integer NULL
  ,wiederbeschaffungswert decimal(10,2) NULL
  ,bueroref bigint NULL
  ,hauptbauwerkref bigint NULL
  ,naechstes_sbwref bigint NULL
  ,paa_knotenref bigint NULL
  ,standortgemeinderef bigint NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
  ,ausfuehrender varchar(50) NULL
  ,auslaufrohr_lichte_hoehe integer NULL
  ,biol_oekol_gesamtbeurteilung_bemerkung varchar(255) NULL
  ,datum_letzte_untersuchung date NULL
  ,datum_untersuchung date NULL
  ,einfluss_aeusserer_aspekt varchar(255) NULL
  ,einfluss_hilfsindikatoren varchar(255) NULL
  ,einfluss_makroinvertebraten varchar(255) NULL
  ,einfluss_wasserpflanzen varchar(255) NULL
  ,gewaesserart varchar(255) NULL
  ,gewaesserspezifische_entlastungsfracht_nh4_n_geplant integer NULL
  ,gewaesserspezifische_entlastungsfracht_nh4_n_ist integer NULL
  ,gewaesserspezifische_entlastungsfracht_nh4_n_ist_optimiert integer NULL
  ,handlungsbedarf varchar(255) NULL
  ,immissionsorientierte_berechnung varchar(255) NULL
  ,oberflaechengewaesser varchar(20) NULL
  ,obj_id_biol_oekol_gesamtbeurteilung varchar(16) NULL
  ,q347 decimal(8,3) NULL
  ,relevantes_gefaelle integer NULL
  ,relevanzmatrix varchar(255) NULL
  ,vergleich_letzte_untersuchung varchar(255) NULL
  ,wasserspiegel_hydraulik decimal(7,3) NULL
  ,ausfuehrende_firmaref bigint NULL
  ,aggregatezahl integer NULL
  ,einwohner_dim_geplant integer NULL
  ,einwohner_dim_ist integer NULL
  ,flaeche_bef_dim_geplant decimal(10,4) NULL
  ,flaeche_bef_dim_ist decimal(10,4) NULL
  ,flaeche_dim_geplant decimal(10,4) NULL
  ,flaeche_dim_ist decimal(10,4) NULL
  ,flaeche_red_dim_geplant decimal(10,4) NULL
  ,flaeche_red_dim_ist decimal(10,4) NULL
  ,foerderaggregat_nutzungsart_ist varchar(255) NULL
  ,foerderhoehe_geodaetisch decimal(7,2) NULL
  ,foerderstrommax decimal(9,3) NULL
  ,foerderstrommin decimal(9,3) NULL
  ,fremdwasseranfall_geplant decimal(9,3) NULL
  ,fremdwasseranfall_ist decimal(9,3) NULL
  ,pumpenregime varchar(255) NULL
  ,schmutzabwasseranfall_geplant decimal(9,3) NULL
  ,schmutzabwasseranfall_ist decimal(9,3) NULL
  ,stauraum decimal(10,2) NULL
  ,volumen_pumpensumpf decimal(10,2) NULL
  ,einwohner_geplant integer NULL
  ,einwohner_ist integer NULL
  ,entlastungsanteil_nh4_n_geplant decimal(5,2) NULL
  ,entlastungsanteil_nh4_n_ist decimal(5,2) NULL
  ,entlastungsanteil_nh4_n_ist_optimiert decimal(5,2) NULL
  ,entlastungsfracht_nh4_n_geplant integer NULL
  ,entlastungsfracht_nh4_n_ist integer NULL
  ,entlastungsfracht_nh4_n_ist_optimiert integer NULL
  ,flaeche_bef_geplant decimal(10,4) NULL
  ,flaeche_bef_ist decimal(10,4) NULL
  ,flaeche_geplant decimal(10,4) NULL
  ,flaeche_ist decimal(10,4) NULL
  ,flaeche_red_geplant decimal(10,4) NULL
  ,flaeche_red_ist decimal(10,4) NULL
  ,fremdwasseranfall_geplant1 decimal(9,3) NULL
  ,fremdwasseranfall_ist1 decimal(9,3) NULL
  ,mehrbelastung_geplant decimal(5,2) NULL
  ,mehrbelastung_ist decimal(5,2) NULL
  ,mehrbelastung_ist_optimiert decimal(5,2) NULL
  ,qan_geplant decimal(9,3) NULL
  ,qan_ist decimal(9,3) NULL
  ,qan_ist_optimiert decimal(9,3) NULL
  ,schmutzabwasseranfall_geplant1 decimal(9,3) NULL
  ,schmutzabwasseranfall_ist1 decimal(9,3) NULL
  ,springt_an varchar(255) NULL
  ,stauraum1 decimal(10,2) NULL
  ,ueberlauf_bemerkung varchar(80) NULL
  ,ueberlaufdauer_geplant decimal(6,1) NULL
  ,ueberlaufdauer_ist decimal(6,1) NULL
  ,ueberlaufdauer_ist_optimiert decimal(6,1) NULL
  ,ueberlaufhaeufigkeit_geplant decimal(4,1) NULL
  ,ueberlaufhaeufigkeit_ist decimal(4,1) NULL
  ,ueberlaufhaeufigkeit_ist_optimiert decimal(4,1) NULL
  ,ueberlaufmenge_geplant decimal(10,2) NULL
  ,ueberlaufmenge_ist decimal(10,2) NULL
  ,ueberlaufmenge_ist_optimiert decimal(10,2) NULL
  ,wehr_art varchar(255) NULL
  ,einleitstelleref bigint NULL
  ,einwohner_dim_geplant1 integer NULL
  ,einwohner_dim_ist1 integer NULL
  ,einwohner_geplant1 integer NULL
  ,einwohner_ist1 integer NULL
  ,entlastungsanteil_nh4_n_geplant1 decimal(5,2) NULL
  ,entlastungsanteil_nh4_n_ist1 decimal(5,2) NULL
  ,entlastungsanteil_nh4_n_ist_optimiert1 decimal(5,2) NULL
  ,entlastungsfracht_nh4_n_geplant1 integer NULL
  ,entlastungsfracht_nh4_n_ist1 integer NULL
  ,entlastungsfracht_nh4_n_ist_optimiert1 integer NULL
  ,flaeche_bef_dim_geplant1 decimal(10,4) NULL
  ,flaeche_bef_dim_ist1 decimal(10,4) NULL
  ,flaeche_bef_geplant1 decimal(10,4) NULL
  ,flaeche_bef_ist1 decimal(10,4) NULL
  ,flaeche_dim_geplant1 decimal(10,4) NULL
  ,flaeche_dim_ist1 decimal(10,4) NULL
  ,flaeche_geplant1 decimal(10,4) NULL
  ,flaeche_ist1 decimal(10,4) NULL
  ,flaeche_red_dim_geplant1 decimal(10,4) NULL
  ,flaeche_red_dim_ist1 decimal(10,4) NULL
  ,flaeche_red_geplant1 decimal(10,4) NULL
  ,flaeche_red_ist1 decimal(10,4) NULL
  ,fremdwasseranfall_geplant2 decimal(9,3) NULL
  ,fremdwasseranfall_ist2 decimal(9,3) NULL
  ,mehrbelastung_geplant1 decimal(5,2) NULL
  ,mehrbelastung_ist1 decimal(5,2) NULL
  ,mehrbelastung_ist_optimiert1 decimal(5,2) NULL
  ,nutzinhalt_fangteil decimal(10,2) NULL
  ,nutzinhalt_klaerteil decimal(10,2) NULL
  ,qan_geplant1 decimal(9,3) NULL
  ,qan_ist1 decimal(9,3) NULL
  ,qan_ist_optimiert1 decimal(9,3) NULL
  ,regenbecken_anordnung varchar(255) NULL
  ,schmutzabwasseranfall_geplant2 decimal(9,3) NULL
  ,schmutzabwasseranfall_ist2 decimal(9,3) NULL
  ,stauraum2 decimal(10,2) NULL
  ,ueberlauf_bemerkung1 varchar(80) NULL
  ,ueberlaufdauer_geplant1 decimal(6,1) NULL
  ,ueberlaufdauer_ist1 decimal(6,1) NULL
  ,ueberlaufdauer_ist_optimiert1 decimal(6,1) NULL
  ,ueberlaufhaeufigkeit_geplant1 decimal(4,1) NULL
  ,ueberlaufhaeufigkeit_ist1 decimal(4,1) NULL
  ,ueberlaufhaeufigkeit_ist_optimiert1 decimal(4,1) NULL
  ,ueberlaufmenge_geplant1 decimal(10,2) NULL
  ,ueberlaufmenge_ist1 decimal(10,2) NULL
  ,ueberlaufmenge_ist_optimiert1 decimal(10,2) NULL
  ,einleitstelleref1 bigint NULL
  ,einwohner_dim_geplant2 integer NULL
  ,einwohner_dim_ist2 integer NULL
  ,flaeche_bef_dim_geplant2 decimal(10,4) NULL
  ,flaeche_bef_dim_ist2 decimal(10,4) NULL
  ,flaeche_dim_geplant2 decimal(10,4) NULL
  ,flaeche_dim_ist2 decimal(10,4) NULL
  ,flaeche_red_dim_geplant2 decimal(10,4) NULL
  ,flaeche_red_dim_ist2 decimal(10,4) NULL
  ,fremdwasseranfall_geplant3 decimal(9,3) NULL
  ,fremdwasseranfall_ist3 decimal(9,3) NULL
  ,notueberlauf varchar(255) NULL
  ,nutzinhalt decimal(10,2) NULL
  ,qab_geplant decimal(9,3) NULL
  ,qab_ist decimal(9,3) NULL
  ,qab_ist_optimiert decimal(9,3) NULL
  ,regenbecken_anordnung1 varchar(255) NULL
  ,schmutzabwasseranfall_geplant3 decimal(9,3) NULL
  ,schmutzabwasseranfall_ist3 decimal(9,3) NULL
  ,stauraum3 decimal(10,2) NULL
  ,art varchar(255) NULL
  ,mehrbelastung_geplant2 decimal(5,2) NULL
  ,mehrbelastung_ist2 decimal(5,2) NULL
  ,mehrbelastung_ist_optimiert2 decimal(5,2) NULL
  ,qan_geplant2 decimal(9,3) NULL
  ,qan_ist2 decimal(9,3) NULL
  ,qan_ist_optimiert2 decimal(9,3) NULL
  ,stauraum4 decimal(10,2) NULL
  ,primaerrichtungref bigint NULL
  ,beschrieb varchar(255) NULL
)
;
-- VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat
CREATE TABLE vsadssmini_arrow.vsadssmini_ueberlauf_foerderaggregat (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,art varchar(255) NULL
  ,bezeichnung varchar(41) NULL
  ,knotenref bigint NULL
  ,knoten_nachref bigint NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
)
;
-- VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet
CREATE TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,abflussbegrenzung_geplant decimal(4,1) NULL
  ,abflussbegrenzung_ist decimal(4,1) NULL
  ,abflussbeiwert_rw_geplant decimal(5,2) NULL
  ,abflussbeiwert_rw_ist decimal(5,2) NULL
  ,abflussbeiwert_sw_geplant decimal(5,2) NULL
  ,abflussbeiwert_sw_ist decimal(5,2) NULL
  ,befestigungsgrad_rw_geplant decimal(5,2) NULL
  ,befestigungsgrad_rw_ist decimal(5,2) NULL
  ,befestigungsgrad_sw_geplant decimal(5,2) NULL
  ,befestigungsgrad_sw_ist decimal(5,2) NULL
  ,bemerkung varchar(80) NULL
  ,bezeichnung varchar(20) NULL
  ,direkteinleitung_in_gewaesser_geplant varchar(255) NULL
  ,direkteinleitung_in_gewaesser_ist varchar(255) NULL
  ,einwohnerdichte_geplant integer NULL
  ,einwohnerdichte_ist integer NULL
  ,entwaesserungssystem_geplant varchar(255) NULL
  ,entwaesserungssystem_ist varchar(255) NULL
  ,flaeche decimal(10,4) NULL
  ,fremdwasseranfall_geplant decimal(9,3) NULL
  ,fremdwasseranfall_ist decimal(9,3) NULL
  ,perimeter geometry(POLYGON,2056) NULL
  ,retention_geplant varchar(255) NULL
  ,retention_ist varchar(255) NULL
  ,schmutzabwasseranfall_geplant decimal(9,3) NULL
  ,schmutzabwasseranfall_ist decimal(9,3) NULL
  ,textpos geometry(POINT,2056) NULL
  ,versickerung_geplant varchar(255) NULL
  ,versickerung_ist varchar(255) NULL
  ,knoten_rw_istref bigint NULL
  ,knoten_rw_geplantref bigint NULL
  ,knoten_sw_istref bigint NULL
  ,knoten_sw_geplantref bigint NULL
  ,sbw_rw_istref bigint NULL
  ,sbw_rw_geplantref bigint NULL
  ,sbw_sw_istref bigint NULL
  ,sbw_sw_geplantref bigint NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
)
;
CREATE INDEX vsadssmini_teileinzgsgbiet_perimeter_idx ON vsadssmini_arrow.vsadssmini_teileinzugsgebiet USING GIST ( perimeter );
CREATE INDEX vsadssmini_teileinzgsgbiet_textpos_idx ON vsadssmini_arrow.vsadssmini_teileinzugsgebiet USING GIST ( textpos );
-- VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt
CREATE TABLE vsadssmini_arrow.vsadssmini_kennlinie_stuetzpunkt (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,abfluss decimal(9,3) NULL
  ,hoehe decimal(7,3) NULL
  ,obj_id_hq_relation varchar(16) NULL
  ,astatus varchar(255) NULL
  ,zufluss decimal(9,3) NULL
  ,sk_duekeroberhauptref bigint NULL
  ,sk_pumpwerkref bigint NULL
  ,sk_regenrueckhaltebecken_kanalref bigint NULL
  ,sk_regenueberlaufref bigint NULL
  ,sk_regenueberlaufbeckenref bigint NULL
  ,sk_trennbauwerkref bigint NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
)
;
-- VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,art varchar(255) NULL
  ,beckenentleerung_art varchar(255) NULL
  ,beckenentleerung_leistung decimal(9,3) NULL
  ,beckenreinigung_art varchar(255) NULL
  ,bemerkung varchar(80) NULL
  ,drosselorgan_art varchar(255) NULL
  ,drosselorgan_oeffnung_ist integer NULL
  ,drosselorgan_oeffnung_ist_optimiert integer NULL
  ,feststoffrueckhalt_anspringkote decimal(7,3) NULL
  ,feststoffrueckhalt_art varchar(255) NULL
  ,feststoffrueckhalt_dimensionierungswert decimal(9,3) NULL
  ,foerderaggregat_bauart varchar(255) NULL
  ,foerderaggregat_foerderstrommax_einzeln decimal(9,3) NULL
  ,foerderaggregat_foerderstrommin_einzeln decimal(9,3) NULL
  ,messgeraet_art varchar(255) NULL
  ,messgeraet_messart varchar(255) NULL
  ,messgeraet_staukoerper varchar(255) NULL
  ,messgeraet_zweck varchar(255) NULL
  ,notentlastung_kote decimal(7,3) NULL
  ,obj_id_absperr_drosselorgan varchar(16) NULL
  ,obj_id_messstelle varchar(16) NULL
  ,obj_id_ueberlauf varchar(16) NULL
  ,rueckstausicherung_art varchar(255) NULL
  ,ueberlauf_hydrueberfalllaenge decimal(7,2) NULL
  ,ueberlauf_kotemax decimal(7,3) NULL
  ,ueberlauf_kotemin decimal(7,3) NULL
  ,notenlastung_einleitstelleref bigint NULL
  ,stammkarteref bigint NULL
  ,ueberlaufnachref bigint NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
)
;
-- VSADSSMINI_2020_LV95.VSADSSMini.Massnahme
CREATE TABLE vsadssmini_arrow.vsadssmini_massnahme (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,bemerkung varchar(80) NULL
  ,beschreibung varchar(100) NULL
  ,bezeichnung varchar(50) NULL
  ,datum_eingang date NULL
  ,gesamtkosten decimal(10,2) NULL
  ,handlungsbedarf varchar(255) NULL
  ,jahr_umsetzung_effektiv integer NULL
  ,jahr_umsetzung_geplant integer NULL
  ,kategorie varchar(255) NULL
  ,linie geometry(LINESTRING,2056) NULL
  ,perimeter geometry(POLYGON,2056) NULL
  ,prioritaet varchar(255) NULL
  ,astatus varchar(255) NULL
  ,symbolpos geometry(POINT,2056) NULL
  ,verweis varchar(255) NULL
  ,traegerschaftref bigint NULL
  ,verantwortlich_ausloesungref bigint NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
)
;
CREATE INDEX vsadssmini_massnahme_linie_idx ON vsadssmini_arrow.vsadssmini_massnahme USING GIST ( linie );
CREATE INDEX vsadssmini_massnahme_perimeter_idx ON vsadssmini_arrow.vsadssmini_massnahme USING GIST ( perimeter );
CREATE INDEX vsadssmini_massnahme_symbolpos_idx ON vsadssmini_arrow.vsadssmini_massnahme USING GIST ( symbolpos );
-- VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_LeitungAssoc
CREATE TABLE vsadssmini_arrow.vsadssmini_massnahme_leitungassoc (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,leitungref bigint NULL
  ,massnahme_leitungassocref bigint NULL
)
;
-- VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_KnotenAssoc
CREATE TABLE vsadssmini_arrow.vsadssmini_massnahme_knotenassoc (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,knotenref bigint NULL
  ,massnahme_knotenassocref bigint NULL
)
;
-- VSADSSMINI_2020_LV95.VSADSSMini.ALR
CREATE TABLE vsadssmini_arrow.vsadssmini_alr (
  T_Id bigint PRIMARY KEY DEFAULT nextval('vsadssmini_arrow.t_ili2db_seq')
  ,T_Ili_Tid varchar(200) NULL
  ,beseitigung_ist varchar(255) NULL
  ,bezeichnung varchar(20) NULL
  ,einwohnerwerte integer NULL
  ,lage geometry(POINT,2056) NULL
  ,obj_id_entsorgung varchar(16) NULL
  ,obj_id_entsorgung_abwasserbauwerk varchar(16) NULL
  ,obj_id_entsorgung_einleitstelle varchar(16) NULL
  ,obj_id_entsorgung_versickerungsanlage varchar(16) NULL
  ,sanierungsbedarf varchar(255) NULL
  ,sanierungsdatum date NULL
  ,sanierungskonzept varchar(255) NULL
  ,massnahmeref bigint NULL
  ,datenherrref bigint NULL
  ,datenlieferantref bigint NULL
  ,letzte_aenderung date NULL
)
;
CREATE INDEX vsadssmini_alr_lage_idx ON vsadssmini_arrow.vsadssmini_alr USING GIST ( lage );
CREATE TABLE vsadssmini_arrow.T_ILI2DB_BASKET (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
  ,domains varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.T_ILI2DB_DATASET (
  T_Id bigint PRIMARY KEY
  ,datasetName varchar(200) NULL
)
;
CREATE TABLE vsadssmini_arrow.T_ILI2DB_INHERITANCE (
  thisClass varchar(1024) PRIMARY KEY
  ,baseClass varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.T_ILI2DB_TRAFO (
  iliname varchar(1024) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE vsadssmini_arrow.T_ILI2DB_MODEL (
  filename varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (modelName,iliversion)
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet_retention_ist (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_drosselorgan_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten_lagegenauigkeit (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_einleitstelle_handlungsbedarf (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten_nutzungsart_ist (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_alr_sanierungsbedarf (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet_retention_geplant (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_messart (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_baulicherzustand (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_leckschutz (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_regenbeckn_nrdnung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenentleerung_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.plantyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_statuswerte (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_massnahme_status (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.valignment (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten_nutzungsart_geplant (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten_funktionhierarchisch (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_regenueberlauf_wehr_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_hilfsindikatoren (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_makroinvertebraten (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_ueberlauf_foerderaggregat_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_pumpwerk_pumpenregime (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.administration_organisation_organisationstyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten_funktion (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_nach (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_staukoerper (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenreinigung_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet_direkteinleitung_n_gwssr_gplant (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_einleitstelle_vergleich_letzte_untersuchung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_einleitstelle_relevanzmatrix (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten_sanierungsbedarf (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.astatus (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet_versickerung_ist (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_material (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_regenueberlauf_springt_an (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_informationsquelle (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten_baulicherzustand (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_foerderaggregat_bauart (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_sanierungsbedarf (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten_finanzierung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_massnahme_prioritaet (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_profiltyp (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_lagebestimmung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_aeusserer_aspekt (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_trennbauwerk_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_wasserpflanzen (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.administration_organisation_status (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_reliner_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_einleitstelle_immissionsorientierte_berechnung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_knoten_zugaenglichkeit (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_finanzierung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_massnahme_kategorie (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_kennlinie_stuetzpunkt_status (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet_versickerung_geplant (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_regenueberlaufbecken_regenbecken_anordnung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_feststoffrueckhalt_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_rueckstausicherung_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_von (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_nutzungsart_geplant (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_zweck (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.halignment (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_sk_steuerung_fernwirkung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet_direkteinleitung_in_gewassr_ist (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_nutzungsart_ist (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.vsadssmini_leitung_wbw_bauart (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE vsadssmini_arrow.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
CREATE TABLE vsadssmini_arrow.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) NOT NULL
  ,SqlName varchar(1024) NOT NULL
  ,ColOwner varchar(1024) NOT NULL
  ,Target varchar(1024) NULL
  ,PRIMARY KEY (ColOwner,SqlName)
)
;
CREATE TABLE vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (
  tablename varchar(255) NOT NULL
  ,subtype varchar(255) NULL
  ,columnname varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE vsadssmini_arrow.T_ILI2DB_TABLE_PROP (
  tablename varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
ALTER TABLE vsadssmini_arrow.administration_organisation ADD CONSTRAINT administration_organstion_gemeindenummer_check CHECK( gemeindenummer BETWEEN 1 AND 9999);
ALTER TABLE vsadssmini_arrow.vsadssmini_rohrprofil_geometrie ADD CONSTRAINT vsadssmini_rhrprfl_gmtrie_reihenfolge_check CHECK( reihenfolge BETWEEN 1 AND 999);
ALTER TABLE vsadssmini_arrow.vsadssmini_rohrprofil_geometrie ADD CONSTRAINT vsadssmini_rhrprfl_gmtrie_x_check CHECK( x BETWEEN -9.99999999999E7 AND 9.99999999999E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_rohrprofil_geometrie ADD CONSTRAINT vsadssmini_rhrprfl_gmtrie_y_check CHECK( y BETWEEN -9.99999999999E7 AND 9.99999999999E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_knoten ADD CONSTRAINT vsadssmini_knoten_ara_nr_check CHECK( ara_nr BETWEEN 1 AND 999999);
ALTER TABLE vsadssmini_arrow.vsadssmini_knoten ADD CONSTRAINT vsadssmini_knoten_baujahr_check CHECK( baujahr BETWEEN 1800 AND 2100);
ALTER TABLE vsadssmini_arrow.vsadssmini_knoten ADD CONSTRAINT vsadssmini_knoten_deckelkote_check CHECK( deckelkote BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_knoten ADD CONSTRAINT vsadssmini_knoten_dimension1_check CHECK( dimension1 BETWEEN 0 AND 4000);
ALTER TABLE vsadssmini_arrow.vsadssmini_knoten ADD CONSTRAINT vsadssmini_knoten_dimension2_check CHECK( dimension2 BETWEEN 0 AND 4000);
ALTER TABLE vsadssmini_arrow.vsadssmini_knoten ADD CONSTRAINT vsadssmini_knoten_rueckstaukote_ist_check CHECK( rueckstaukote_ist BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_knoten ADD CONSTRAINT vsadssmini_knoten_sohlenkote_check CHECK( sohlenkote BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_knoten ADD CONSTRAINT vsadssmini_knoten_symbolori_check CHECK( symbolori BETWEEN 0.0 AND 359.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_knoten ADD CONSTRAINT vsadssmini_knoten_zustandserhebung_jahr_check CHECK( zustandserhebung_jahr BETWEEN 1800 AND 2100);
ALTER TABLE vsadssmini_arrow.vsadssmini_knoten_text ADD CONSTRAINT vsadssmini_knoten_text_textori_check CHECK( textori BETWEEN 0.0 AND 359.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_baujahr_check CHECK( baujahr BETWEEN 1800 AND 2100);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_hydr_belastung_ist_check CHECK( hydr_belastung_ist BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_kote_nach_check CHECK( kote_nach BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_kote_von_check CHECK( kote_von BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_laengeeffektiv_check CHECK( laengeeffektiv BETWEEN 0.0 AND 30000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_lichte_breite_check CHECK( lichte_breite BETWEEN 0 AND 4000);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_lichte_hoehe_check CHECK( lichte_hoehe BETWEEN 0 AND 99999);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_reliner_nennweite_check CHECK( reliner_nennweite BETWEEN 0 AND 99999);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_wandrauhigkeit_check CHECK( wandrauhigkeit BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_wbw_basisjahr_check CHECK( wbw_basisjahr BETWEEN 1800 AND 2100);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_wiederbeschaffungswert_check CHECK( wiederbeschaffungswert BETWEEN 0.0 AND 9.999999999E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung ADD CONSTRAINT vsadssmini_leitung_zustandserhebung_jahr_check CHECK( zustandserhebung_jahr BETWEEN 1800 AND 2100);
ALTER TABLE vsadssmini_arrow.vsadssmini_leitung_text ADD CONSTRAINT vsadssmini_leitung_text_textori_check CHECK( textori BETWEEN 0.0 AND 359.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_wbw_basisjahr_check CHECK( wbw_basisjahr BETWEEN 1800 AND 2100);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_wiederbeschaffungswert_check CHECK( wiederbeschaffungswert BETWEEN 0.0 AND 9.999999999E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_auslaufrohr_lichte_hoehe_check CHECK( auslaufrohr_lichte_hoehe BETWEEN 0 AND 99999);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_gewssrspzfsc_nh4_n_gplant_check CHECK( gewaesserspezifische_entlastungsfracht_nh4_n_geplant BETWEEN 0 AND 1000000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_gewssrspzfsccht_nh4_n_ist_check CHECK( gewaesserspezifische_entlastungsfracht_nh4_n_ist BETWEEN 0 AND 1000000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_gewssrspzfsc4_n_st_ptmert_check CHECK( gewaesserspezifische_entlastungsfracht_nh4_n_ist_optimiert BETWEEN 0 AND 1000000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_q347_check CHECK( q347 BETWEEN 0.0 AND 10000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_relevantes_gefaelle_check CHECK( relevantes_gefaelle BETWEEN 0 AND 1000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_wasserspiegel_hydraulik_check CHECK( wasserspiegel_hydraulik BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_aggregatezahl_check CHECK( aggregatezahl BETWEEN 1 AND 9);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_einwohner_dim_geplant_check CHECK( einwohner_dim_geplant BETWEEN 0 AND 300000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_einwohner_dim_ist_check CHECK( einwohner_dim_ist BETWEEN 0 AND 300000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_bef_dim_geplant_check CHECK( flaeche_bef_dim_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_bef_dim_ist_check CHECK( flaeche_bef_dim_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_dim_geplant_check CHECK( flaeche_dim_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_dim_ist_check CHECK( flaeche_dim_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_red_dim_geplant_check CHECK( flaeche_red_dim_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_red_dim_ist_check CHECK( flaeche_red_dim_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_foerderhoehe_geodaetisch_check CHECK( foerderhoehe_geodaetisch BETWEEN 0.0 AND 30000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_foerderstrommax_check CHECK( foerderstrommax BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_foerderstrommin_check CHECK( foerderstrommin BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_fremdwasseranfall_geplant_check CHECK( fremdwasseranfall_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_fremdwasseranfall_ist_check CHECK( fremdwasseranfall_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_schmutzabwassrnfll_gplant_check CHECK( schmutzabwasseranfall_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_schmutzabwasseranfall_ist_check CHECK( schmutzabwasseranfall_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_stauraum_check CHECK( stauraum BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_volumen_pumpensumpf_check CHECK( volumen_pumpensumpf BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_einwohner_geplant_check CHECK( einwohner_geplant BETWEEN 0 AND 300000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_einwohner_ist_check CHECK( einwohner_ist BETWEEN 0 AND 300000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlstngsntl_nh4_n_gplant_check CHECK( entlastungsanteil_nh4_n_geplant BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlastungsantl_nh4_n_ist_check CHECK( entlastungsanteil_nh4_n_ist BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlstngsntl4_n_st_ptmert_check CHECK( entlastungsanteil_nh4_n_ist_optimiert BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlstngsfrc_nh4_n_gplant_check CHECK( entlastungsfracht_nh4_n_geplant BETWEEN 0 AND 1000000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlastngsfrcht_nh4_n_ist_check CHECK( entlastungsfracht_nh4_n_ist BETWEEN 0 AND 1000000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlstngsfrc4_n_st_ptmert_check CHECK( entlastungsfracht_nh4_n_ist_optimiert BETWEEN 0 AND 1000000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_bef_geplant_check CHECK( flaeche_bef_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_bef_ist_check CHECK( flaeche_bef_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_geplant_check CHECK( flaeche_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_ist_check CHECK( flaeche_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_red_geplant_check CHECK( flaeche_red_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_red_ist_check CHECK( flaeche_red_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_fremdwasseranfall_geplnt1_check CHECK( fremdwasseranfall_geplant1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_fremdwasseranfall_ist1_check CHECK( fremdwasseranfall_ist1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_mehrbelastung_geplant_check CHECK( mehrbelastung_geplant BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_mehrbelastung_ist_check CHECK( mehrbelastung_ist BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_mehrbelastung_ist_optmert_check CHECK( mehrbelastung_ist_optimiert BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qan_geplant_check CHECK( qan_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qan_ist_check CHECK( qan_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qan_ist_optimiert_check CHECK( qan_ist_optimiert BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_schmutzabwassrnfll_gplnt1_check CHECK( schmutzabwasseranfall_geplant1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_schmutzabwasseranfall_st1_check CHECK( schmutzabwasseranfall_ist1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_stauraum1_check CHECK( stauraum1 BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufdauer_geplant_check CHECK( ueberlaufdauer_geplant BETWEEN 0.0 AND 10000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufdauer_ist_check CHECK( ueberlaufdauer_ist BETWEEN 0.0 AND 10000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufdauer_ist_ptmert_check CHECK( ueberlaufdauer_ist_optimiert BETWEEN 0.0 AND 10000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufhaeufigkt_gplant_check CHECK( ueberlaufhaeufigkeit_geplant BETWEEN 0.0 AND 999.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufhaeufigkeit_ist_check CHECK( ueberlaufhaeufigkeit_ist BETWEEN 0.0 AND 999.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufhafgkt_st_ptmert_check CHECK( ueberlaufhaeufigkeit_ist_optimiert BETWEEN 0.0 AND 999.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufmenge_geplant_check CHECK( ueberlaufmenge_geplant BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufmenge_ist_check CHECK( ueberlaufmenge_ist BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufmenge_ist_ptmert_check CHECK( ueberlaufmenge_ist_optimiert BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_einwohner_dim_geplant1_check CHECK( einwohner_dim_geplant1 BETWEEN 0 AND 300000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_einwohner_dim_ist1_check CHECK( einwohner_dim_ist1 BETWEEN 0 AND 300000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_einwohner_geplant1_check CHECK( einwohner_geplant1 BETWEEN 0 AND 300000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_einwohner_ist1_check CHECK( einwohner_ist1 BETWEEN 0 AND 300000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlstngsntl_nh4_n_gplnt1_check CHECK( entlastungsanteil_nh4_n_geplant1 BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlastungsantl_nh4_n_st1_check CHECK( entlastungsanteil_nh4_n_ist1 BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlstngsntl4_n_st_ptmrt1_check CHECK( entlastungsanteil_nh4_n_ist_optimiert1 BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlstngsfrc_nh4_n_gplnt1_check CHECK( entlastungsfracht_nh4_n_geplant1 BETWEEN 0 AND 1000000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlastngsfrcht_nh4_n_st1_check CHECK( entlastungsfracht_nh4_n_ist1 BETWEEN 0 AND 1000000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_entlstngsfrc4_n_st_ptmrt1_check CHECK( entlastungsfracht_nh4_n_ist_optimiert1 BETWEEN 0 AND 1000000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_bef_dim_geplant1_check CHECK( flaeche_bef_dim_geplant1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_bef_dim_ist1_check CHECK( flaeche_bef_dim_ist1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_bef_geplant1_check CHECK( flaeche_bef_geplant1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_bef_ist1_check CHECK( flaeche_bef_ist1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_dim_geplant1_check CHECK( flaeche_dim_geplant1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_dim_ist1_check CHECK( flaeche_dim_ist1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_geplant1_check CHECK( flaeche_geplant1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_ist1_check CHECK( flaeche_ist1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_red_dim_geplant1_check CHECK( flaeche_red_dim_geplant1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_red_dim_ist1_check CHECK( flaeche_red_dim_ist1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_red_geplant1_check CHECK( flaeche_red_geplant1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_red_ist1_check CHECK( flaeche_red_ist1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_fremdwasseranfall_geplnt2_check CHECK( fremdwasseranfall_geplant2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_fremdwasseranfall_ist2_check CHECK( fremdwasseranfall_ist2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_mehrbelastung_geplant1_check CHECK( mehrbelastung_geplant1 BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_mehrbelastung_ist1_check CHECK( mehrbelastung_ist1 BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_mehrbelastung_ist_optmrt1_check CHECK( mehrbelastung_ist_optimiert1 BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_nutzinhalt_fangteil_check CHECK( nutzinhalt_fangteil BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_nutzinhalt_klaerteil_check CHECK( nutzinhalt_klaerteil BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qan_geplant1_check CHECK( qan_geplant1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qan_ist1_check CHECK( qan_ist1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qan_ist_optimiert1_check CHECK( qan_ist_optimiert1 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_schmutzabwassrnfll_gplnt2_check CHECK( schmutzabwasseranfall_geplant2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_schmutzabwasseranfall_st2_check CHECK( schmutzabwasseranfall_ist2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_stauraum2_check CHECK( stauraum2 BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufdauer_geplant1_check CHECK( ueberlaufdauer_geplant1 BETWEEN 0.0 AND 10000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufdauer_ist1_check CHECK( ueberlaufdauer_ist1 BETWEEN 0.0 AND 10000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufdauer_ist_ptmrt1_check CHECK( ueberlaufdauer_ist_optimiert1 BETWEEN 0.0 AND 10000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufhaeufigkt_gplnt1_check CHECK( ueberlaufhaeufigkeit_geplant1 BETWEEN 0.0 AND 999.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufhaeufigkeit_ist1_check CHECK( ueberlaufhaeufigkeit_ist1 BETWEEN 0.0 AND 999.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufhafgkt_st_ptmrt1_check CHECK( ueberlaufhaeufigkeit_ist_optimiert1 BETWEEN 0.0 AND 999.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufmenge_geplant1_check CHECK( ueberlaufmenge_geplant1 BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufmenge_ist1_check CHECK( ueberlaufmenge_ist1 BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_ueberlaufmenge_ist_ptmrt1_check CHECK( ueberlaufmenge_ist_optimiert1 BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_einwohner_dim_geplant2_check CHECK( einwohner_dim_geplant2 BETWEEN 0 AND 300000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_einwohner_dim_ist2_check CHECK( einwohner_dim_ist2 BETWEEN 0 AND 300000);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_bef_dim_geplant2_check CHECK( flaeche_bef_dim_geplant2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_bef_dim_ist2_check CHECK( flaeche_bef_dim_ist2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_dim_geplant2_check CHECK( flaeche_dim_geplant2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_dim_ist2_check CHECK( flaeche_dim_ist2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_red_dim_geplant2_check CHECK( flaeche_red_dim_geplant2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_flaeche_red_dim_ist2_check CHECK( flaeche_red_dim_ist2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_fremdwasseranfall_geplnt3_check CHECK( fremdwasseranfall_geplant3 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_fremdwasseranfall_ist3_check CHECK( fremdwasseranfall_ist3 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_nutzinhalt_check CHECK( nutzinhalt BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qab_geplant_check CHECK( qab_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qab_ist_check CHECK( qab_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qab_ist_optimiert_check CHECK( qab_ist_optimiert BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_schmutzabwassrnfll_gplnt3_check CHECK( schmutzabwasseranfall_geplant3 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_schmutzabwasseranfall_st3_check CHECK( schmutzabwasseranfall_ist3 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_stauraum3_check CHECK( stauraum3 BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_mehrbelastung_geplant2_check CHECK( mehrbelastung_geplant2 BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_mehrbelastung_ist2_check CHECK( mehrbelastung_ist2 BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_mehrbelastung_ist_optmrt2_check CHECK( mehrbelastung_ist_optimiert2 BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qan_geplant2_check CHECK( qan_geplant2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qan_ist2_check CHECK( qan_ist2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_qan_ist_optimiert2_check CHECK( qan_ist_optimiert2 BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_sk ADD CONSTRAINT vsadssmini_sk_stauraum4_check CHECK( stauraum4 BETWEEN 0.0 AND 1.0E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_abflussbegrenzung_geplant_check CHECK( abflussbegrenzung_geplant BETWEEN 0.0 AND 999.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_abflussbegrenzung_ist_check CHECK( abflussbegrenzung_ist BETWEEN 0.0 AND 999.9);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_abflussbeiwert_rw_geplant_check CHECK( abflussbeiwert_rw_geplant BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_abflussbeiwert_rw_ist_check CHECK( abflussbeiwert_rw_ist BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_abflussbeiwert_sw_geplant_check CHECK( abflussbeiwert_sw_geplant BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_abflussbeiwert_sw_ist_check CHECK( abflussbeiwert_sw_ist BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_befestigungsgrd_rw_gplant_check CHECK( befestigungsgrad_rw_geplant BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_befestigungsgrad_rw_ist_check CHECK( befestigungsgrad_rw_ist BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_befestigungsgrd_sw_gplant_check CHECK( befestigungsgrad_sw_geplant BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_befestigungsgrad_sw_ist_check CHECK( befestigungsgrad_sw_ist BETWEEN 0.0 AND 100.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_einwohnerdichte_geplant_check CHECK( einwohnerdichte_geplant BETWEEN 0 AND 10000);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_einwohnerdichte_ist_check CHECK( einwohnerdichte_ist BETWEEN 0 AND 10000);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_flaeche_check CHECK( flaeche BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_fremdwasseranfall_geplant_check CHECK( fremdwasseranfall_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_fremdwasseranfall_ist_check CHECK( fremdwasseranfall_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_schmutzabwassrnfll_gplant_check CHECK( schmutzabwasseranfall_geplant BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_teileinzugsgebiet ADD CONSTRAINT vsadssmini_teilenzgsgbiet_schmutzabwasseranfall_ist_check CHECK( schmutzabwasseranfall_ist BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_kennlinie_stuetzpunkt ADD CONSTRAINT vsadssmini_knnln_sttzpnkt_abfluss_check CHECK( abfluss BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_kennlinie_stuetzpunkt ADD CONSTRAINT vsadssmini_knnln_sttzpnkt_hoehe_check CHECK( hoehe BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_kennlinie_stuetzpunkt ADD CONSTRAINT vsadssmini_knnln_sttzpnkt_zufluss_check CHECK( zufluss BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_beckenentleerung_leistung_check CHECK( beckenentleerung_leistung BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_drosselorgan_oeffnung_ist_check CHECK( drosselorgan_oeffnung_ist BETWEEN 0 AND 99999);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_drosslrgn_ffnng_st_ptmert_check CHECK( drosselorgan_oeffnung_ist_optimiert BETWEEN 0 AND 99999);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_feststffrckhlt_nsprngkote_check CHECK( feststoffrueckhalt_anspringkote BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_feststffrckhdmnsnrngswert_check CHECK( feststoffrueckhalt_dimensionierungswert BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_foerdrggrgt_rstrmmx_nzeln_check CHECK( foerderaggregat_foerderstrommax_einzeln BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_foerdrggrgt_rstrmmn_nzeln_check CHECK( foerderaggregat_foerderstrommin_einzeln BETWEEN 0.0 AND 100000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_notentlastung_kote_check CHECK( notentlastung_kote BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_ueberlauf_hydruebrflllnge_check CHECK( ueberlauf_hydrueberfalllaenge BETWEEN 0.0 AND 30000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_ueberlauf_kotemax_check CHECK( ueberlauf_kotemax BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_bauwerkskomponente ADD CONSTRAINT vsadssmini_bauwrkskmpnnte_ueberlauf_kotemin_check CHECK( ueberlauf_kotemin BETWEEN -200.0 AND 5000.0);
ALTER TABLE vsadssmini_arrow.vsadssmini_massnahme ADD CONSTRAINT vsadssmini_massnahme_gesamtkosten_check CHECK( gesamtkosten BETWEEN 0.0 AND 9.999999999E7);
ALTER TABLE vsadssmini_arrow.vsadssmini_massnahme ADD CONSTRAINT vsadssmini_massnahme_jahr_umsetzung_effektiv_check CHECK( jahr_umsetzung_effektiv BETWEEN 1800 AND 2100);
ALTER TABLE vsadssmini_arrow.vsadssmini_massnahme ADD CONSTRAINT vsadssmini_massnahme_jahr_umsetzung_geplant_check CHECK( jahr_umsetzung_geplant BETWEEN 1800 AND 2100);
ALTER TABLE vsadssmini_arrow.vsadssmini_alr ADD CONSTRAINT vsadssmini_alr_einwohnerwerte_check CHECK( einwohnerwerte BETWEEN 0 AND 300000);
CREATE UNIQUE INDEX T_ILI2DB_DATASET_datasetName_key ON vsadssmini_arrow.T_ILI2DB_DATASET (datasetName)
;
CREATE UNIQUE INDEX T_ILI2DB_MODEL_modelName_iliversion_key ON vsadssmini_arrow.T_ILI2DB_MODEL (modelName,iliversion)
;
CREATE UNIQUE INDEX T_ILI2DB_ATTRNAME_ColOwner_SqlName_key ON vsadssmini_arrow.T_ILI2DB_ATTRNAME (ColOwner,SqlName)
;
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Nutzungsart_geplant','vsadssmini_leitung_nutzungsart_geplant');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat','vsadssmini_ueberlauf_foerderaggregat');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken_EinleitstelleAssoc','vsadssmini_sk_regenueberlaufbecken_einleitstelleassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_TraegerschaftAssoc','vsadssmini_massnahme_traegerschaftassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('INTERLIS.VALIGNMENT','valignment');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Text','vsadssmini_leitung_text');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR','vsadssmini_alr');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Beckenentleerung_Art','vsadssmini_bauwerkskomponente_beckenentleerung_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_SW_IstAssoc','vsadssmini_teileinzugsgebiet_knoten_sw_istassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Regenbecken_Anordnung','vsadssmini_sk_regenrueckhaltebecken_kanal_regenbeckn_nrdnung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt','vsadssmini_kennlinie_stuetzpunkt');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_BetreiberAssoc','vsadssmini_knoten_betreiberassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Prioritaet','vsadssmini_massnahme_prioritaet');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SIA405_Base_Abwasser_LV95.Plantyp','plantyp');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle','vsadssmini_sk_einleitstelle');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Drosselorgan_Art','vsadssmini_bauwerkskomponente_drosselorgan_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_DuekeroberhauptAssoc','vsadssmini_kennlinie_stuetzpunkt_sk_duekeroberhauptassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie','vsadssmini_rohrprofil_geometrie');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Messgeraet_Art','vsadssmini_bauwerkskomponente_messgeraet_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Sanierungsbedarf','vsadssmini_knoten_sanierungsbedarf');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass','vsadssmini_vsa_baseclass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Finanzierung','vsadssmini_leitung_finanzierung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc','vsadssmini_datenlieferantassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc','vsadssmini_datenherrassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Vergleich_letzte_Untersuchung','vsadssmini_sk_einleitstelle_vergleich_letzte_untersuchung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt.Status','vsadssmini_kennlinie_stuetzpunkt_status');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Leitung_nachAssoc','vsadssmini_leitung_leitung_nachassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Direkteinleitung_in_Gewaesser_geplant','vsadssmini_teileinzugsgebiet_direkteinleitung_n_gwssr_gplant');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Uebrige','vsadssmini_sk_uebrige');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.Beseitigung_Ist','vsadssmini_alr_beseitigung_ist');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Relevanzmatrix','vsadssmini_sk_einleitstelle_relevanzmatrix');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass','sia405_baseclass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR_MassnahmeAssoc','vsadssmini_alr_massnahmeassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.Sanierungsbedarf','vsadssmini_alr_sanierungsbedarf');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil','vsadssmini_rohrprofil');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Nutzungsart_Ist','vsadssmini_leitung_nutzungsart_ist');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Versickerung_Ist','vsadssmini_teileinzugsgebiet_versickerung_ist');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Kategorie','vsadssmini_massnahme_kategorie');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Feststoffrueckhalt_Art','vsadssmini_bauwerkskomponente_feststoffrueckhalt_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_StandortgemeindeAssoc','vsadssmini_sk_standortgemeindeassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Retention_Ist','vsadssmini_teileinzugsgebiet_retention_ist');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf','vsadssmini_sk_regenueberlauf');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_BetreiberAssoc','vsadssmini_leitung_betreiberassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Profiltyp','vsadssmini_leitung_profiltyp');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK.Informationsquelle','vsadssmini_sk_informationsquelle');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Hoehengenauigkeit_nach','vsadssmini_leitung_hoehengenauigkeit_nach');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Sanierungsbedarf','vsadssmini_leitung_sanierungsbedarf');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Messgeraet_Messart','vsadssmini_bauwerkskomponente_messgeraet_messart');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.FunktionHydraulisch','vsadssmini_leitung_funktionhydraulisch');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_RW_geplantAssoc','vsadssmini_teileinzugsgebiet_knoten_rw_geplantassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Beckenreinigung_Art','vsadssmini_bauwerkskomponente_beckenreinigung_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_SW_geplantAssoc','vsadssmini_teileinzugsgebiet_sbw_sw_geplantassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Material','vsadssmini_leitung_material');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_SW_geplantAssoc','vsadssmini_teileinzugsgebiet_knoten_sw_geplantassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Handlungsbedarf','vsadssmini_sk_einleitstelle_handlungsbedarf');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SIA405_Base_Abwasser_LV95.Status','astatus');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Einfluss_Aeusserer_Aspekt','vsadssmini_sk_einleitstelle_einfluss_aeusserer_aspekt');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_RegenueberlaufAssoc','vsadssmini_kennlinie_stuetzpunkt_sk_regenueberlaufassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Base_LV95.BaseClass','baseclass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Reliner_Art','vsadssmini_leitung_reliner_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Messgeraet_Zweck','vsadssmini_bauwerkskomponente_messgeraet_zweck');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Art','vsadssmini_bauwerkskomponente_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Springt_an','vsadssmini_sk_regenueberlauf_springt_an');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Nutzungsart_geplant','vsadssmini_knoten_nutzungsart_geplant');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_PumpwerkAssoc','vsadssmini_kennlinie_stuetzpunkt_sk_pumpwerkassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie_RohrprofilAssoc','vsadssmini_rohrprofil_geometrie_rohrprofilassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente','vsadssmini_bauwerkskomponente');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Zugaenglichkeit','vsadssmini_knoten_zugaenglichkeit');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Hoehengenauigkeit_von','vsadssmini_leitung_hoehengenauigkeit_von');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Duekeroberhaupt','vsadssmini_sk_duekeroberhaupt');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_Notenlastung_EinleitstelleAssoc','vsadssmini_bauwerkskomponente_notenlastung_einleitstellessoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat_KnotenAssoc','vsadssmini_ueberlauf_foerderaggregat_knotenassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk.Art','vsadssmini_sk_trennbauwerk_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_RW_IstAssoc','vsadssmini_teileinzugsgebiet_knoten_rw_istassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk_PrimaerrichtungAssoc','vsadssmini_sk_trennbauwerk_primaerrichtungassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_RW_geplantAssoc','vsadssmini_teileinzugsgebiet_sbw_rw_geplantassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Entwaesserungssystem_Ist','vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.BaulicherZustand','vsadssmini_knoten_baulicherzustand');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Lagegenauigkeit','vsadssmini_knoten_lagegenauigkeit');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Knoten_nachAssoc','vsadssmini_leitung_knoten_nachassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk','vsadssmini_sk_trennbauwerk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Funktion','vsadssmini_knoten_funktion');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_PAA_KnotenAssoc','vsadssmini_sk_paa_knotenassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal','vsadssmini_sk_regenrueckhaltebecken_kanal');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Base_LV95.TextPos','textpos');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_StammkarteAssoc','vsadssmini_bauwerkskomponente_stammkarteassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Regenbecken_Anordnung','vsadssmini_sk_regenueberlaufbecken_regenbecken_anordnung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_TextAssoc','vsadssmini_knoten_textassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_KnotenAssoc','vsadssmini_massnahme_knotenassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Einfluss_Wasserpflanzen','vsadssmini_sk_einleitstelle_einfluss_wasserpflanzen');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_EigentuemerAssoc','vsadssmini_leitung_eigentuemerassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Messgeraet_Staukoerper','vsadssmini_bauwerkskomponente_messgeraet_staukoerper');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation.Status','administration_organisation_status');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_TrennbauwerkAssoc','vsadssmini_kennlinie_stuetzpunkt_sk_trennbauwerkassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Autonome_Messstelle','vsadssmini_sk_autonome_messstelle');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk','vsadssmini_sk_pumpwerk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Foerderaggregat_Nutzungsart_Ist','vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Knoten_vonAssoc','vsadssmini_leitung_knoten_vonassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_Text','vsadssmini_knoten_text');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat.Art','vsadssmini_ueberlauf_foerderaggregat_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung','vsadssmini_leitung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Nutzungsart_Ist','vsadssmini_knoten_nutzungsart_ist');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_RW_IstAssoc','vsadssmini_teileinzugsgebiet_sbw_rw_istassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.BaulicherZustand','vsadssmini_leitung_baulicherzustand');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Gewaesserart','vsadssmini_sk_einleitstelle_gewaesserart');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.WBW_Bauart','vsadssmini_leitung_wbw_bauart');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Naechstes_SBWAssoc','vsadssmini_sk_naechstes_sbwassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_LeitungAssoc','vsadssmini_massnahme_leitungassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Leckschutz','vsadssmini_leitung_leckschutz');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Pumpenregime','vsadssmini_sk_pumpwerk_pumpenregime');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme','vsadssmini_massnahme');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Retention_geplant','vsadssmini_teileinzugsgebiet_retention_geplant');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.FunktionHierarchisch','vsadssmini_leitung_funktionhierarchisch');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_RohrprofilAssoc','vsadssmini_leitung_rohrprofilassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_EigentuemerAssoc','vsadssmini_knoten_eigentuemerassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Einfluss_Hilfsindikatoren','vsadssmini_sk_einleitstelle_einfluss_hilfsindikatoren');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Statuswerte','vsadssmini_statuswerte');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Direkteinleitung_in_Gewaesser_Ist','vsadssmini_teileinzugsgebiet_direkteinleitung_in_gewassr_ist');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_Verantwortlich_AusloesungAssoc','vsadssmini_massnahme_verantwortlich_ausloesungassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Einfluss_Makroinvertebraten','vsadssmini_sk_einleitstelle_einfluss_makroinvertebraten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('INTERLIS.HALIGNMENT','halignment');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Immissionsorientierte_Berechnung','vsadssmini_sk_einleitstelle_immissionsorientierte_berechnung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_BueroAssoc','vsadssmini_sk_bueroassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_HauptbauwerkAssoc','vsadssmini_sk_hauptbauwerkassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.FunktionHierarchisch','vsadssmini_knoten_funktionhierarchisch');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_RegenueberlaufbeckenAssoc','vsadssmini_kennlinie_stuetzpunkt_sk_regenueberlaufbeckenssoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken','vsadssmini_sk_regenueberlaufbecken');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Entwaesserungssystem_geplant','vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Notueberlauf','vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Status','vsadssmini_massnahme_status');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_Regenrueckhaltebecken_kanalAssoc','vsadssmini_kennlinie_stuetzpunkt_sk_regenruckhltbckn_knlssoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation.Organisationstyp','administration_organisation_organisationstyp');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat_Knoten_nachAssoc','vsadssmini_ueberlauf_foerderaggregat_knoten_nachassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf_EinleitstelleAssoc','vsadssmini_sk_regenueberlauf_einleitstelleassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_UeberlaufNachAssoc','vsadssmini_bauwerkskomponente_ueberlaufnachassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Rueckstausicherung_Art','vsadssmini_bauwerkskomponente_rueckstausicherung_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_TextPos','sia405_textpos');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK.Steuerung_Fernwirkung','vsadssmini_sk_steuerung_fernwirkung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle_Ausfuehrende_FirmaAssoc','vsadssmini_sk_einleitstelle_ausfuehrende_firmaassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Wehr_Art','vsadssmini_sk_regenueberlauf_wehr_art');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Foerderaggregat_Bauart','vsadssmini_bauwerkskomponente_foerderaggregat_bauart');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Finanzierung','vsadssmini_knoten_finanzierung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_TextAssoc','vsadssmini_leitung_textassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet','vsadssmini_teileinzugsgebiet');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_SW_IstAssoc','vsadssmini_teileinzugsgebiet_sbw_sw_istassoc');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Lagebestimmung','vsadssmini_leitung_lagebestimmung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Versickerung_geplant','vsadssmini_teileinzugsgebiet_versickerung_geplant');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Entlastungsanteil_NH4_N_Ist','entlastungsanteil_nh4_n_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Einfluss_Wasserpflanzen','einfluss_wasserpflanzen','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Flaeche_Dim_Ist','flaeche_dim_ist2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk.Mehrbelastung_Ist','mehrbelastung_ist2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Stauraum','stauraum3','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_TraegerschaftAssoc.TraegerschaftRef','traegerschaftref','vsadssmini_massnahme','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Ueberlaufhaeufigkeit_Ist','ueberlaufhaeufigkeit_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.ARA_Nr','ara_nr','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Einwohner_Dim_Ist','einwohner_dim_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Material','material','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Prioritaet','prioritaet','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Deckelkote','deckelkote','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Ueberlaufhaeufigkeit_geplant','ueberlaufhaeufigkeit_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Fremdwasseranfall_Ist','fremdwasseranfall_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Entlastungsfracht_NH4_N_Ist_optimiert','entlastungsfracht_nh4_n_ist_optimiert1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Einwohner_Dim_geplant','einwohner_dim_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Foerderaggregat_FoerderstromMin_einzeln','foerderaggregat_foerderstrommin_einzeln','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk.Qan_geplant','qan_geplant2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_rohrprofil',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_TextPos.Plantyp','plantyp','vsadssmini_knoten_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Flaeche_bef_Dim_geplant','flaeche_bef_dim_geplant2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Ueberlaufhaeufigkeit_geplant','ueberlaufhaeufigkeit_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Linie','linie','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Bemerkung','bemerkung','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.OBJ_ID_Deckel','obj_id_deckel','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Flaeche_bef_Ist','flaeche_bef_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Flaeche_Dim_geplant','flaeche_dim_geplant2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Fremdwasseranfall_Ist','fremdwasseranfall_ist2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Bemerkung','bemerkung','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Mehrbelastung_Ist','mehrbelastung_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Entlastungsanteil_NH4_N_geplant','entlastungsanteil_nh4_n_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Nutzungsart_geplant','nutzungsart_geplant','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Einwohner_geplant','einwohner_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_KnotenAssoc.KnotenRef','knotenref','vsadssmini_massnahme_knotenassoc','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk.Qan_Ist','qan_ist2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Foerderaggregat_Bauart','foerderaggregat_bauart','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_LeitungAssoc.LeitungRef','leitungref','vsadssmini_massnahme_leitungassoc','vsadssmini_leitung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_TextPos.Bemerkung','bemerkung','vsadssmini_knoten_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Finanzierung','finanzierung','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Feststoffrueckhalt_Dimensionierungswert','feststoffrueckhalt_dimensionierungswert','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Vergleich_letzte_Untersuchung','vergleich_letzte_untersuchung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_ueberlauf_foerderaggregat',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt.Zufluss','zufluss','vsadssmini_kennlinie_stuetzpunkt',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Entwaesserungssystem_Ist','entwaesserungssystem_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Mehrbelastung_Ist_optimiert','mehrbelastung_ist_optimiert','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_RW_geplantAssoc.SBW_RW_geplantRef','sbw_rw_geplantref','vsadssmini_teileinzugsgebiet','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Ueberlaufmenge_geplant','ueberlaufmenge_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.OBJ_ID_Entsorgung_Abwasserbauwerk','obj_id_entsorgung_abwasserbauwerk','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_Dim_Ist','flaeche_dim_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Bemerkung','bemerkung','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.BaulicherZustand','baulicherzustand','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Nutzungsart_Ist','nutzungsart_ist','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_bauwerkskomponente','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_bef_Dim_Ist','flaeche_bef_dim_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Fremdwasseranfall_geplant','fremdwasseranfall_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_massnahme','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Naechstes_SBWAssoc.Naechstes_SBWRef','naechstes_sbwref','vsadssmini_sk','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Fremdwasseranfall_geplant','fremdwasseranfall_geplant3','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Rueckstaukote_Ist','rueckstaukote_ist','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Zustandserhebung_Jahr','zustandserhebung_jahr','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_StandortgemeindeAssoc.StandortgemeindeRef','standortgemeinderef','vsadssmini_sk','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Flaeche_red_Ist','flaeche_red_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Retention_geplant','retention_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Datum_Untersuchung','datum_untersuchung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Knoten_vonAssoc.Knoten_vonRef','knoten_vonref','vsadssmini_leitung','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation.Organisationstyp','organisationstyp','administration_organisation',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.relevantes_Gefaelle','relevantes_gefaelle','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Flaeche_red_Dim_Ist','flaeche_red_dim_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_UeberlaufNachAssoc.UeberlaufNachRef','ueberlaufnachref','vsadssmini_bauwerkskomponente','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_PumpwerkAssoc.SK_PumpwerkRef','sk_pumpwerkref','vsadssmini_kennlinie_stuetzpunkt','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Entlastungsfracht_NH4_N_geplant','entlastungsfracht_nh4_n_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt.Abfluss','abfluss','vsadssmini_kennlinie_stuetzpunkt',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_ueberlauf_foerderaggregat','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Abflussbegrenzung_geplant','abflussbegrenzung_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_teileinzugsgebiet','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Flaeche_Ist','flaeche_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.Einwohnerwerte','einwohnerwerte','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Fremdwasseranfall_Ist','fremdwasseranfall_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Ueberlauf_HydrUeberfalllaenge','ueberlauf_hydrueberfalllaenge','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Verlauf','verlauf','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Ueberlaufmenge_geplant','ueberlaufmenge_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk.Qan_Ist_optimiert','qan_ist_optimiert2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR_MassnahmeAssoc.MassnahmeRef','massnahmeref','vsadssmini_alr','vsadssmini_massnahme');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Zustandserhebung_Jahr','zustandserhebung_jahr','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Stauraum','stauraum1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Q347','q347','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.FoerderstromMin','foerderstrommin','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Uebrige.Beschrieb','beschrieb','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Schmutzabwasseranfall_Ist','schmutzabwasseranfall_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.Beseitigung_Ist','beseitigung_ist','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Beckenentleerung_Leistung','beckenentleerung_leistung','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation.Status','astatus','administration_organisation',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_rohrprofil','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Qan_Ist','qan_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.BaulicherZustand','baulicherzustand','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Gewaesserspezifische_Entlastungsfracht_NH4_N_Ist_optimiert','gewaesserspezifische_entlastungsfracht_nh4_n_ist_optimiert','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Base_LV95.TextPos.TextPos','textpos','vsadssmini_knoten_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.Sanierungsdatum','sanierungsdatum','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Base_LV95.TextPos.TextOri','textori','vsadssmini_knoten_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Bezeichnung','bezeichnung','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Gewaesserart','gewaesserart','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Springt_an','springt_an','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Entlastungsfracht_NH4_N_Ist_optimiert','entlastungsfracht_nh4_n_ist_optimiert','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_TextPos.Textinhalt','textinhalt','vsadssmini_leitung_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Abflussbeiwert_RW_geplant','abflussbeiwert_rw_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Ueberlauf_KoteMax','ueberlauf_kotemax','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_Ist','flaeche_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.OBJ_ID_Biol_oekol_Gesamtbeurteilung','obj_id_biol_oekol_gesamtbeurteilung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Schmutzabwasseranfall_geplant','schmutzabwasseranfall_geplant2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Abflussbeiwert_SW_Ist','abflussbeiwert_sw_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Gewaesserspezifische_Entlastungsfracht_NH4_N_geplant','gewaesserspezifische_entlastungsfracht_nh4_n_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Foerderaggregat_FoerderstromMax_einzeln','foerderaggregat_foerderstrommax_einzeln','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Ueberlaufmenge_Ist_optimiert','ueberlaufmenge_ist_optimiert1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Fremdwasseranfall_Ist','fremdwasseranfall_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_bauwerkskomponente','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk.Mehrbelastung_geplant','mehrbelastung_geplant2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.Lage','lage','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Notueberlauf','notueberlauf','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Schmutzabwasseranfall_geplant','schmutzabwasseranfall_geplant3','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Stauraum','stauraum2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.TextPos','textpos','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_sk','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk.Stauraum','stauraum4','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Feststoffrueckhalt_Art','feststoffrueckhalt_art','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_TextAssoc.LeitungRef','leitungref','vsadssmini_leitung_text','vsadssmini_leitung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK.Standortname','standortname','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Datum_Eingang','datum_eingang','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Entlastungsfracht_NH4_N_Ist','entlastungsfracht_nh4_n_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Fremdwasseranfall_geplant','fremdwasseranfall_geplant2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Kote_von','kote_von','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie.Reihenfolge','reihenfolge','vsadssmini_rohrprofil_geometrie',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken_EinleitstelleAssoc.EinleitstelleRef','einleitstelleref1','vsadssmini_sk','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Retention_Ist','retention_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Qab_Ist_optimiert','qab_ist_optimiert','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.Bezeichnung','bezeichnung','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Lagebestimmung','lagebestimmung','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Ueberlaufdauer_geplant','ueberlaufdauer_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Nutzungsart_Ist','nutzungsart_ist','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.Sanierungsbedarf','sanierungsbedarf','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Bemerkung','bemerkung','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Perimeter','perimeter','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Nutzinhalt_Klaerteil','nutzinhalt_klaerteil','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Qan_Ist_optimiert','qan_ist_optimiert1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Fremdwasseranfall_Ist','fremdwasseranfall_ist3','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Nutzinhalt_Fangteil','nutzinhalt_fangteil','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Entlastungsanteil_NH4_N_Ist','entlastungsanteil_nh4_n_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.OBJ_ID_nachHaltungspunkt','obj_id_nachhaltungspunkt','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Immissionsorientierte_Berechnung','immissionsorientierte_berechnung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_StammkarteAssoc.StammkarteRef','stammkarteref','vsadssmini_bauwerkskomponente','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.FunktionHierarchisch','funktionhierarchisch','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Beckenentleerung_Art','beckenentleerung_art','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation.Bemerkung','bemerkung','administration_organisation',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Sohlenkote','sohlenkote','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Feststoffrueckhalt_Anspringkote','feststoffrueckhalt_anspringkote','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Qab_Ist','qab_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Wandrauhigkeit','wandrauhigkeit','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_RW_IstAssoc.Knoten_RW_IstRef','knoten_rw_istref','vsadssmini_teileinzugsgebiet','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_red_geplant','flaeche_red_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.Sanierungskonzept','sanierungskonzept','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Lage','lage','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Hoehengenauigkeit_von','hoehengenauigkeit_von','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Dimension2','dimension2','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Versickerung_Ist','versickerung_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_RohrprofilAssoc.RohrprofilRef','rohrprofilref','vsadssmini_leitung','vsadssmini_rohrprofil');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt.Hoehe','hoehe','vsadssmini_kennlinie_stuetzpunkt',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Ueberlauf_Bemerkung','ueberlauf_bemerkung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Rueckstausicherung_Art','rueckstausicherung_art','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_BetreiberAssoc.BetreiberRef','betreiberref','vsadssmini_knoten','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK.Sachbearbeiter','sachbearbeiter','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Relevanzmatrix','relevanzmatrix','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Baujahr','baujahr','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.OBJ_ID_vonHaltungspunkt','obj_id_vonhaltungspunkt','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_alr','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation.Bezeichnung','bezeichnung','administration_organisation',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Bemerkung','bemerkung','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_SW_geplantAssoc.SBW_SW_geplantRef','sbw_sw_geplantref','vsadssmini_teileinzugsgebiet','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_SW_IstAssoc.Knoten_SW_IstRef','knoten_sw_istref','vsadssmini_teileinzugsgebiet','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.OBJ_ID_Entsorgung','obj_id_entsorgung','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Schmutzabwasseranfall_Ist','schmutzabwasseranfall_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Mehrbelastung_Ist_optimiert','mehrbelastung_ist_optimiert1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Status','astatus','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Lichte_Breite','lichte_breite','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Ueberlaufdauer_Ist_optimiert','ueberlaufdauer_ist_optimiert','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat_KnotenAssoc.KnotenRef','knotenref','vsadssmini_ueberlauf_foerderaggregat','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_SW_IstAssoc.SBW_SW_IstRef','sbw_sw_istref','vsadssmini_teileinzugsgebiet','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Messgeraet_Art','messgeraet_art','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_leitung','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Messgeraet_Messart','messgeraet_messart','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Ueberlaufmenge_Ist','ueberlaufmenge_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Dimension1','dimension1','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.LaengeEffektiv','laengeeffektiv','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Kote_nach','kote_nach','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_RegenueberlaufbeckenAssoc.SK_RegenueberlaufbeckenRef','sk_regenueberlaufbeckenref','vsadssmini_kennlinie_stuetzpunkt','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Qan_geplant','qan_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_RegenueberlaufAssoc.SK_RegenueberlaufRef','sk_regenueberlaufref','vsadssmini_kennlinie_stuetzpunkt','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_rohrprofil_geometrie','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_kennlinie_stuetzpunkt','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt.Status','astatus','vsadssmini_kennlinie_stuetzpunkt',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.FunktionHierarchisch','funktionhierarchisch','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Notentlastung_Kote','notentlastung_kote','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil.Bemerkung','bemerkung','vsadssmini_rohrprofil',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_rohrprofil_geometrie',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.SymbolOri','symbolori','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Detailgeometrie','detailgeometrie','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Verweis','verweis','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_knoten','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_SW_geplantAssoc.Knoten_SW_geplantRef','knoten_sw_geplantref','vsadssmini_teileinzugsgebiet','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Finanzierung','finanzierung','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Biol_oekol_Gesamtbeurteilung_Bemerkung','biol_oekol_gesamtbeurteilung_bemerkung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Wehr_Art','wehr_art','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Einwohner_Dim_geplant','einwohner_dim_geplant2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Einfluss_Makroinvertebraten','einfluss_makroinvertebraten','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.FoerderstromMax','foerderstrommax','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_BueroAssoc.BueroRef','bueroref','vsadssmini_sk','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_TextAssoc.KnotenRef','knotenref','vsadssmini_knoten_text','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.OBJ_ID_Abwasserbauwerk','obj_id_abwasserbauwerk','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK.Bemerkung','bemerkung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.OBJ_ID_Ueberlauf','obj_id_ueberlauf','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Schmutzabwasseranfall_geplant','schmutzabwasseranfall_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.OBJ_ID_Entsorgung_Versickerungsanlage','obj_id_entsorgung_versickerungsanlage','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Stauraum','stauraum','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR.OBJ_ID_Entsorgung_Einleitstelle','obj_id_entsorgung_einleitstelle','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation.Kurzbezeichnung','kurzbezeichnung','administration_organisation',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_ueberlauf_foerderaggregat','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_massnahme','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK.Informationsquelle','informationsquelle','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_BetreiberAssoc.BetreiberRef','betreiberref','vsadssmini_leitung','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Abflussbeiwert_RW_Ist','abflussbeiwert_rw_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Flaeche','flaeche','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk.Art','art','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Versickerung_geplant','versickerung_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_geplant','flaeche_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Einwohner_Dim_Ist','einwohner_dim_ist2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Einfluss_Hilfsindikatoren','einfluss_hilfsindikatoren','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Flaeche_bef_Dim_geplant','flaeche_bef_dim_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat.Bezeichnung','bezeichnung','vsadssmini_ueberlauf_foerderaggregat',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation.Gemeindenummer','gemeindenummer','administration_organisation',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Foerderhoehe_geodaetisch','foerderhoehe_geodaetisch','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_TrennbauwerkAssoc.SK_TrennbauwerkRef','sk_trennbauwerkref','vsadssmini_kennlinie_stuetzpunkt','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Lagegenauigkeit','lagegenauigkeit','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_TextPos.Plantyp','plantyp','vsadssmini_leitung_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_Regenrueckhaltebecken_kanalAssoc.SK_Regenrueckhaltebecken_kanalRef','sk_regenrueckhaltebecken_kanalref','vsadssmini_kennlinie_stuetzpunkt','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Jahr_Umsetzung_geplant','jahr_umsetzung_geplant','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Flaeche_red_Dim_Ist','flaeche_red_dim_ist2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Einwohner_Dim_Ist','einwohner_dim_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Entlastungsanteil_NH4_N_geplant','entlastungsanteil_nh4_n_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Abflussbegrenzung_Ist','abflussbegrenzung_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat_Knoten_nachAssoc.Knoten_nachRef','knoten_nachref','vsadssmini_ueberlauf_foerderaggregat','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Qan_geplant','qan_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Ueberlaufhaeufigkeit_Ist','ueberlaufhaeufigkeit_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Ueberlaufdauer_geplant','ueberlaufdauer_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Mehrbelastung_Ist','mehrbelastung_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk_PrimaerrichtungAssoc.PrimaerrichtungRef','primaerrichtungref','vsadssmini_sk','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Ueberlauf_KoteMin','ueberlauf_kotemin','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Base_LV95.TextPos.TextVAli','textvali','vsadssmini_leitung_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Regenbecken_Anordnung','regenbecken_anordnung1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_Dim_geplant','flaeche_dim_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_Notenlastung_EinleitstelleAssoc.Notenlastung_EinleitstelleRef','notenlastung_einleitstelleref','vsadssmini_bauwerkskomponente','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Direkteinleitung_in_Gewaesser_Ist','direkteinleitung_in_gewaesser_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Flaeche_bef_Dim_Ist','flaeche_bef_dim_ist2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf_EinleitstelleAssoc.EinleitstelleRef','einleitstelleref','vsadssmini_sk','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Qab_geplant','qab_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie.X','x','vsadssmini_rohrprofil_geometrie',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Mehrbelastung_geplant','mehrbelastung_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Bezeichnung','bezeichnung','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Perimeter','perimeter','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Bezeichnung','bezeichnung','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Entlastungsfracht_NH4_N_Ist','entlastungsfracht_nh4_n_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Messgeraet_Zweck','messgeraet_zweck','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Art','art','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Befestigungsgrad_RW_Ist','befestigungsgrad_rw_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Drosselorgan_Oeffnung_Ist_optimiert','drosselorgan_oeffnung_ist_optimiert','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Schmutzabwasseranfall_geplant','schmutzabwasseranfall_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_RW_geplantAssoc.Knoten_RW_geplantRef','knoten_rw_geplantref','vsadssmini_teileinzugsgebiet','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt.OBJ_ID_HQ_Relation','obj_id_hq_relation','vsadssmini_kennlinie_stuetzpunkt',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_rohrprofil','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Baujahr','baujahr','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Befestigungsgrad_SW_geplant','befestigungsgrad_sw_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_bef_Dim_geplant','flaeche_bef_dim_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Wiederbeschaffungswert','wiederbeschaffungswert','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_KnotenAssoc.Massnahme_KnotenAssocRef','massnahme_knotenassocref','vsadssmini_massnahme_knotenassoc','vsadssmini_massnahme');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_bef_geplant','flaeche_bef_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.SymbolPos','symbolpos','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Reliner_Nennweite','reliner_nennweite','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Mehrbelastung_geplant','mehrbelastung_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat.Art','art','vsadssmini_ueberlauf_foerderaggregat',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Ueberlaufhaeufigkeit_Ist_optimiert','ueberlaufhaeufigkeit_ist_optimiert','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Flaeche_Dim_geplant','flaeche_dim_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Hydr_Belastung_Ist','hydr_belastung_ist','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_bef_Ist','flaeche_bef_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Qan_Ist','qan_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Flaeche_Dim_Ist','flaeche_dim_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Ueberlauf_Bemerkung','ueberlauf_bemerkung1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_teileinzugsgebiet','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.OBJ_ID_Abwasserbauwerk','obj_id_abwasserbauwerk','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Ueberlaufdauer_Ist','ueberlaufdauer_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Kategorie','kategorie','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_red_Ist','flaeche_red_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Ueberlaufdauer_Ist_optimiert','ueberlaufdauer_ist_optimiert1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.WBW_Bauart','wbw_bauart','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Entlastungsanteil_NH4_N_Ist_optimiert','entlastungsanteil_nh4_n_ist_optimiert1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Fremdwasseranfall_geplant','fremdwasseranfall_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_TextPos.Bemerkung','bemerkung','vsadssmini_leitung_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Flaeche_red_geplant','flaeche_red_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_DuekeroberhauptAssoc.SK_DuekeroberhauptRef','sk_duekeroberhauptref','vsadssmini_kennlinie_stuetzpunkt','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_alr','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Datum_letzte_Untersuchung','datum_letzte_untersuchung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Qan_Ist_optimiert','qan_ist_optimiert','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Foerderaggregat_Nutzungsart_Ist','foerderaggregat_nutzungsart_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Einwohner_Dim_geplant','einwohner_dim_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Schmutzabwasseranfall_Ist','schmutzabwasseranfall_ist3','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_EigentuemerAssoc.EigentuemerRef','eigentuemerref','vsadssmini_leitung','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Flaeche_red_Dim_geplant','flaeche_red_dim_geplant2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal.Nutzinhalt','nutzinhalt','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Messgeraet_Staukoerper','messgeraet_staukoerper','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_red_Dim_geplant','flaeche_red_dim_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_kennlinie_stuetzpunkt',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Zugaenglichkeit','zugaenglichkeit','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Nutzungsart_geplant','nutzungsart_geplant','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Bezeichnung','bezeichnung','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Befestigungsgrad_RW_geplant','befestigungsgrad_rw_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Beschreibung','beschreibung','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc.DatenlieferantRef','datenlieferantref','vsadssmini_rohrprofil_geometrie','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Status','astatus','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Reliner_Art','reliner_art','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_sk','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Abflussbeiwert_SW_geplant','abflussbeiwert_sw_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Leitung_nachAssoc.Leitung_nachRef','leitung_nachref','vsadssmini_leitung','vsadssmini_leitung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK.WBW_Basisjahr','wbw_basisjahr','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Base_LV95.TextPos.TextPos','textpos','vsadssmini_leitung_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Ueberlaufdauer_Ist','ueberlaufdauer_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Direkteinleitung_in_Gewaesser_geplant','direkteinleitung_in_gewaesser_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Flaeche_red_Dim_Ist','flaeche_red_dim_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie.Y','y','vsadssmini_rohrprofil_geometrie',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Einwohnerdichte_Ist','einwohnerdichte_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_LeitungAssoc.Massnahme_LeitungAssocRef','massnahme_leitungassocref','vsadssmini_massnahme_leitungassoc','vsadssmini_massnahme');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil.Bezeichnung','bezeichnung','vsadssmini_rohrprofil',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk.Mehrbelastung_Ist_optimiert','mehrbelastung_ist_optimiert2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.WBW_Basisjahr','wbw_basisjahr','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Gesamtkosten','gesamtkosten','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Sanierungsbedarf','sanierungsbedarf','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Lichte_Hoehe','lichte_hoehe','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_HauptbauwerkAssoc.HauptbauwerkRef','hauptbauwerkref','vsadssmini_sk','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_TextPos.Textinhalt','textinhalt','vsadssmini_knoten_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Schmutzabwasseranfall_Ist','schmutzabwasseranfall_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Entlastungsfracht_NH4_N_geplant','entlastungsfracht_nh4_n_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Befestigungsgrad_SW_Ist','befestigungsgrad_sw_ist','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Base_LV95.TextPos.TextOri','textori','vsadssmini_leitung_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.FunktionHydraulisch','funktionhydraulisch','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Profiltyp','profiltyp','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Ueberlaufmenge_Ist_optimiert','ueberlaufmenge_ist_optimiert','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_PAA_KnotenAssoc.PAA_KnotenRef','paa_knotenref','vsadssmini_sk','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Aggregatezahl','aggregatezahl','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation.UID','auid','administration_organisation',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Fremdwasseranfall_geplant','fremdwasseranfall_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Gewaesserspezifische_Entlastungsfracht_NH4_N_Ist','gewaesserspezifische_entlastungsfracht_nh4_n_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_RW_IstAssoc.SBW_RW_IstRef','sbw_rw_istref','vsadssmini_teileinzugsgebiet','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Status','astatus','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Ausfuehrender','ausfuehrender','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','administration_organisation',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Schmutzabwasseranfall_geplant','schmutzabwasseranfall_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Base_LV95.TextPos.TextHAli','texthali','vsadssmini_knoten_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Auslaufrohr_Lichte_Hoehe','auslaufrohr_lichte_hoehe','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Einwohner_Ist','einwohner_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Ueberlaufmenge_Ist','ueberlaufmenge_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK.Akten','akten','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Handlungsbedarf','handlungsbedarf','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Flaeche_red_Dim_geplant','flaeche_red_dim_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Einfluss_Aeusserer_Aspekt','einfluss_aeusserer_aspekt','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.OBJ_ID_Messstelle','obj_id_messstelle','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Base_LV95.TextPos.TextHAli','texthali','vsadssmini_leitung_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Beckenreinigung_Art','beckenreinigung_art','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Leckschutz','leckschutz','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Knoten_nachAssoc.Knoten_nachRef','knoten_nachref','vsadssmini_leitung','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle_Ausfuehrende_FirmaAssoc.Ausfuehrende_FirmaRef','ausfuehrende_firmaref','vsadssmini_sk','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Flaeche_geplant','flaeche_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_EigentuemerAssoc.EigentuemerRef','eigentuemerref','vsadssmini_knoten','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Jahr_Umsetzung_effektiv','jahr_umsetzung_effektiv','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Regenbecken_Anordnung','regenbecken_anordnung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Drosselorgan_Art','drosselorgan_art','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.OBJ_ID_Absperr_Drosselorgan','obj_id_absperr_drosselorgan','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_knoten','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Flaeche_bef_Dim_Ist','flaeche_bef_dim_ist','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme.Handlungsbedarf','handlungsbedarf','vsadssmini_massnahme',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Einwohner_geplant','einwohner_geplant1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_kennlinie_stuetzpunkt','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Wasserspiegel_Hydraulik','wasserspiegel_hydraulik','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Hoehengenauigkeit_nach','hoehengenauigkeit_nach','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente.Drosselorgan_Oeffnung_Ist','drosselorgan_oeffnung_ist','vsadssmini_bauwerkskomponente',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Ueberlaufhaeufigkeit_Ist_optimiert','ueberlaufhaeufigkeit_ist_optimiert1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten.Funktion','funktion','vsadssmini_knoten',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Base_LV95.TextPos.TextVAli','textvali','vsadssmini_knoten_text',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung.Sanierungsbedarf','sanierungsbedarf','vsadssmini_leitung',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Pumpenregime','pumpenregime','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Einwohner_Ist','einwohner_ist1','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK.Wiederbeschaffungswert','wiederbeschaffungswert','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_Verantwortlich_AusloesungAssoc.Verantwortlich_AusloesungRef','verantwortlich_ausloesungref','vsadssmini_massnahme','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie_RohrprofilAssoc.RohrprofilRef','rohrprofilref','vsadssmini_rohrprofil_geometrie','vsadssmini_rohrprofil');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle.Oberflaechengewaesser','oberflaechengewaesser','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Entlastungsanteil_NH4_N_Ist_optimiert','entlastungsanteil_nh4_n_ist_optimiert','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk.Volumen_Pumpensumpf','volumen_pumpensumpf','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc.DatenherrRef','datenherrref','vsadssmini_leitung','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK.Steuerung_Fernwirkung','steuerung_fernwirkung','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Entwaesserungssystem_geplant','entwaesserungssystem_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf.Flaeche_bef_geplant','flaeche_bef_geplant','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken.Schmutzabwasseranfall_Ist','schmutzabwasseranfall_ist2','vsadssmini_sk',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet.Einwohnerdichte_geplant','einwohnerdichte_geplant','vsadssmini_teileinzugsgebiet',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass.Letzte_Aenderung','letzte_aenderung','vsadssmini_alr',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Knoten_nachAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken_EinleitstelleAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_TraegerschaftAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Text','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_PAA_KnotenAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_SW_IstAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Base_LV95.TextPos','ch.ehi.ili2db.inheritance','subClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_StammkarteAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_BetreiberAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_DuekeroberhauptAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_TextAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_KnotenAssoc','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass','ch.ehi.ili2db.inheritance','subClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_EigentuemerAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Leitung_nachAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Uebrige','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_TrennbauwerkAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Autonome_Messstelle','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Knoten_vonAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass','ch.ehi.ili2db.inheritance','subClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_Text','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR_MassnahmeAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_RW_IstAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Naechstes_SBWAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_LeitungAssoc','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_StandortgemeindeAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_RohrprofilAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_EigentuemerAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_BetreiberAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_Verantwortlich_AusloesungAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_RW_geplantAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_SW_geplantAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_SW_geplantAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_BueroAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_HauptbauwerkAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_RegenueberlaufAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_RegenueberlaufbeckenAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Base_LV95.BaseClass','ch.ehi.ili2db.inheritance','subClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_Regenrueckhaltebecken_kanalAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat_Knoten_nachAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf_EinleitstelleAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_PumpwerkAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_UeberlaufNachAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie_RohrprofilAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_TextPos','ch.ehi.ili2db.inheritance','subClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Duekeroberhaupt','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle_Ausfuehrende_FirmaAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_Notenlastung_EinleitstelleAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat_KnotenAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_TextAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_SW_IstAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_RW_IstAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk_PrimaerrichtungAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_RW_geplantAssoc','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_EigentuemerAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_PAA_KnotenAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Knoten_vonAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_EigentuemerAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_HauptbauwerkAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_RohrprofilAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Text','SIA405_Base_Abwasser_LV95.SIA405_TextPos');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Base_LV95.BaseClass',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_Verantwortlich_AusloesungAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_BetreiberAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_BaseClass','Base_LV95.BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SIA405_Base_Abwasser_LV95.Administration.Organisation','SIA405_Base_Abwasser_LV95.SIA405_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_RW_geplantAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat_Knoten_nachAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf','VSADSSMINI_2020_LV95.VSADSSMini.SK');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_TrennbauwerkAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_RW_IstAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_TextAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_KnotenAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.ALR_MassnahmeAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken_EinleitstelleAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SIA405_Base_Abwasser_LV95.SIA405_TextPos','Base_LV95.TextPos');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk','VSADSSMINI_2020_LV95.VSADSSMini.SK');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Duekeroberhaupt','VSADSSMINI_2020_LV95.VSADSSMini.SK');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_BueroAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Knoten_nachAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_BetreiberAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_Regenrueckhaltebecken_kanalAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_TraegerschaftAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_SW_IstAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenherrAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.DatenlieferantAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle_Ausfuehrende_FirmaAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Autonome_Messstelle','VSADSSMINI_2020_LV95.VSADSSMini.SK');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten_Text','SIA405_Base_Abwasser_LV95.SIA405_TextPos');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_SW_geplantAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlaufbecken','VSADSSMINI_2020_LV95.VSADSSMini.SK');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_Notenlastung_EinleitstelleAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_RegenueberlaufbeckenAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_Leitung_nachAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_StandortgemeindeAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Naechstes_SBWAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_StammkarteAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Uebrige','VSADSSMINI_2020_LV95.VSADSSMini.SK');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Einleitstelle','VSADSSMINI_2020_LV95.VSADSSMini.SK');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Base_LV95.TextPos','Base_LV95.BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenrueckhaltebecken_kanal','VSADSSMINI_2020_LV95.VSADSSMini.SK');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Trennbauwerk_PrimaerrichtungAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass','SIA405_Base_Abwasser_LV95.SIA405_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_RW_IstAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_SBW_SW_geplantAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme_LeitungAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_PumpwerkAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Massnahme','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Rohrprofil_Geometrie_RohrprofilAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_RW_geplantAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Teileinzugsgebiet_Knoten_SW_IstAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Bauwerkskomponente_UeberlaufNachAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_DuekeroberhauptAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Pumpwerk','VSADSSMINI_2020_LV95.VSADSSMini.SK');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Knoten','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat_KnotenAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.SK_Regenueberlauf_EinleitstelleAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Leitung_TextAssoc',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Ueberlauf_Foerderaggregat','VSADSSMINI_2020_LV95.VSADSSMini.VSA_BaseClass');
INSERT INTO vsadssmini_arrow.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('VSADSSMINI_2020_LV95.VSADSSMini.Kennlinie_Stuetzpunkt_SK_RegenueberlaufAssoc',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_retention_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja',0,'ja','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_retention_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',1,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_retention_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_drosselorgan_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abflussregulator',0,'Abflussregulator','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_drosselorgan_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',1,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_drosselorgan_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Drosselstrecke',2,'Drosselstrecke','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_drosselorgan_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Leapingwehr',3,'Leapingwehr','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_drosselorgan_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Pumpe',4,'Pumpe','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_drosselorgan_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schieber_fix',5,'Schieber fix','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_drosselorgan_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schieber_geregelt',6,'Schieber geregelt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_drosselorgan_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schieber_gesteuert',7,'Schieber gesteuert','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_drosselorgan_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',8,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_lagegenauigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'groesser_50cm',0,'groesser 50cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_lagegenauigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'plusminus_10cm',1,'plusminus 10cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_lagegenauigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'plusminus_3cm',2,'plusminus 3cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_lagegenauigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'plusminus_50cm',3,'plusminus 50cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_lagegenauigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_handlungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja_kurzfristig',0,'ja kurzfristig','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_handlungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja_laengerfristig',1,'ja laengerfristig','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_handlungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Aussage_moeglich',2,'keine Aussage moeglich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_handlungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',3,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_handlungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Status_klaeren',4,'Status klaeren','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_handlungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',5,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bachwasser',1,'Bachwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'entlastetes_Mischabwasser',2,'entlastetes Mischabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Industrieabwasser',3,'Industrieabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Mischabwasser',4,'Mischabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Niederschlagsabwasser',5,'Niederschlagsabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Reinabwasser',6,'Reinabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schmutzabwasser',7,'Schmutzabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',8,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja',0,'ja','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',1,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Drainagetransportleitung',1,'Drainagetransportleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Drosselleitung',2,'Drosselleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Duekerleitung',3,'Duekerleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Freispiegelleitung',4,'Freispiegelleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Pumpendruckleitung',5,'Pumpendruckleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Sickerleitung',6,'Sickerleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Speicherleitung',7,'Speicherleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Spuelleitung',8,'Spuelleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',9,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Vakuumleitung',10,'Vakuumleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhydraulisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Versickerungsleitung',11,'Versickerungsleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Drucksonde',1,'Drucksonde','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Lufteinperlung',2,'Lufteinperlung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'MID_teilgefuellt',3,'MID teilgefuellt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'MID_vollgefuellt',4,'MID vollgefuellt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Radar',5,'Radar','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schwimmer',6,'Schwimmer','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ultraschall',7,'Ultraschall','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',8,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_retention_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja',0,'ja','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_retention_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',1,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_retention_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_messart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_messart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Durchfluss',1,'Durchfluss','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_messart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Niveau',2,'Niveau','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_messart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',3,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Gewaesser',1,'in Gewaesser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Mischabwasserkanalisation',2,'in Mischabwasserkanalisation','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Regenabwasserkanalisation',3,'in Regenabwasserkanalisation','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Schmutzabwasserkanalisation',4,'in Schmutzabwasserkanalisation','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keiner',5,'keiner','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'oberflaechlich_ausmuendend',6,'oberflaechlich ausmuendend','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',7,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',0,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Z0',1,'Z0','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Z1',2,'Z1','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Z2',3,'Z2','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Z3',4,'Z3','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Z4',5,'Z4','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_leckschutz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_vorhanden',0,'nicht vorhanden','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_leckschutz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',1,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_leckschutz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'vorhanden',2,'vorhanden','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Drainagesystem',0,'Drainagesystem','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Mischsystem',1,'Mischsystem','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ModifiziertesSystem',2,'ModifiziertesSystem','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_angeschlossen',3,'nicht angeschlossen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_entwaessert',4,'nicht entwaessert','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Trennsystem',5,'Trennsystem','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',6,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'vorbereitetes_Trennsystem',7,'vorbereitetes Trennsystem','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_regenbeckn_nrdnung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Hauptschluss',0,'Hauptschluss','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_regenbeckn_nrdnung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Nebenschluss',1,'Nebenschluss','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenrueckhaltebecken_kanal_regenbeckn_nrdnung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenentleerung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenentleerung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gravitation',1,'Gravitation','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenentleerung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Pumpe',2,'Pumpe','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenentleerung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schieber',3,'Schieber','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenentleerung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.plantyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Leitungskataster',0,'Leitungskataster','0',NULL);
INSERT INTO vsadssmini_arrow.plantyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Werkplan',1,'Werkplan','0',NULL);
INSERT INTO vsadssmini_arrow.plantyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Uebersichtsplan.UeP10',2,'Uebersichtsplan.UeP10','0',NULL);
INSERT INTO vsadssmini_arrow.plantyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Uebersichtsplan.UeP2',3,'Uebersichtsplan.UeP2','0',NULL);
INSERT INTO vsadssmini_arrow.plantyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Uebersichtsplan.UeP5',4,'Uebersichtsplan.UeP5','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_statuswerte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ausser_Betrieb',0,'ausser Betrieb','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_statuswerte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Betrieb.provisorisch',1,'in Betrieb.provisorisch','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_statuswerte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Betrieb.wird_aufgehoben',2,'in Betrieb.wird aufgehoben','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_statuswerte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'tot.aufgehoben_nicht_verfuellt',3,'tot.aufgehoben nicht verfuellt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_statuswerte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'tot.aufgehoben_unbekannt',4,'tot.aufgehoben unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_statuswerte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'tot.verfuellt',5,'tot.verfuellt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_statuswerte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',6,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_statuswerte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'weitere.Berechnungsvariante',7,'weitere.Berechnungsvariante','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_statuswerte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'weitere.geplant',8,'weitere.geplant','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_statuswerte (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'weitere.Projekt',9,'weitere.Projekt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'erledigt',0,'erledigt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Bearbeitung',1,'in Bearbeitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'pendent',2,'pendent','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'sistiert',3,'sistiert','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Fluss_Stau',0,'Fluss Stau','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Groesseres_Fliessgewaesser',1,'Groesseres Fliessgewaesser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Grosser_Mittellandbach',2,'Grosser Mittellandbach','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Grosser_See',3,'Grosser See','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Grosser_Voralpenbach',4,'Grosser Voralpenbach','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Grosses_Fliessgewaesser',5,'Grosses Fliessgewaesser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kleiner_Mittellandbach',6,'Kleiner Mittellandbach','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kleiner_See',7,'Kleiner See','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kleiner_Voralpenbach',8,'Kleiner Voralpenbach','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Quellgewaesser',9,'Quellgewaesser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_gewaesserart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',10,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Drainagesystem',0,'Drainagesystem','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Mischsystem',1,'Mischsystem','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ModifiziertesSystem',2,'ModifiziertesSystem','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_angeschlossen',3,'nicht angeschlossen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_entwaessert',4,'nicht entwaessert','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Trennsystem',5,'Trennsystem','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',6,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'vorbereitetes_Trennsystem',7,'vorbereitetes Trennsystem','0',NULL);
INSERT INTO vsadssmini_arrow.valignment (seq,iliCode,itfCode,dispName,inactive,description) VALUES (0,'Top',0,'Top','0',NULL);
INSERT INTO vsadssmini_arrow.valignment (seq,iliCode,itfCode,dispName,inactive,description) VALUES (1,'Cap',1,'Cap','0',NULL);
INSERT INTO vsadssmini_arrow.valignment (seq,iliCode,itfCode,dispName,inactive,description) VALUES (2,'Half',2,'Half','0',NULL);
INSERT INTO vsadssmini_arrow.valignment (seq,iliCode,itfCode,dispName,inactive,description) VALUES (3,'Base',3,'Base','0',NULL);
INSERT INTO vsadssmini_arrow.valignment (seq,iliCode,itfCode,dispName,inactive,description) VALUES (4,'Bottom',4,'Bottom','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bachwasser',1,'Bachwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'entlastetes_Mischabwasser',2,'entlastetes Mischabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Industrieabwasser',3,'Industrieabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Mischabwasser',4,'Mischabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Niederschlagsabwasser',5,'Niederschlagsabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Reinabwasser',6,'Reinabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schmutzabwasser',7,'Schmutzabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',8,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PAA',0,'PAA','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SAA',1,'SAA','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenueberlauf_wehr_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenueberlauf_wehr_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Leapingwehr',1,'Leapingwehr','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenueberlauf_wehr_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Streichwehr_hochgezogen',2,'Streichwehr hochgezogen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenueberlauf_wehr_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Streichwehr_niedrig',3,'Streichwehr niedrig','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abflusslose_Toilette',0,'Abflusslose Toilette','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'AbflussloseGrube',1,'AbflussloseGrube','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abwasserfaulraum',2,'Abwasserfaulraum','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',3,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Anschluss_Kanalisation',4,'Anschluss Kanalisation','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Faulgrube',5,'Faulgrube','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Guellegrube',6,'Guellegrube','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kein_Abwasseranfall',7,'kein Abwasseranfall','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Klaergrube',8,'Klaergrube','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'KLARA',9,'KLARA','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_alr_beseitigung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',10,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_hilfsindikatoren (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gross',0,'gross','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_hilfsindikatoren (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kein_klein',1,'kein klein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_hilfsindikatoren (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Aussage_moeglich',2,'keine Aussage moeglich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_hilfsindikatoren (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'mittel',3,'mittel','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_hilfsindikatoren (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_hilfsindikatoren (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unklar',5,'unklar','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_makroinvertebraten (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gross',0,'gross','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_makroinvertebraten (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kein_klein',1,'kein klein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_makroinvertebraten (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Aussage_moeglich',2,'keine Aussage moeglich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_makroinvertebraten (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'mittel',3,'mittel','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_makroinvertebraten (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_makroinvertebraten (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unklar',5,'unklar','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_ueberlauf_foerderaggregat_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Foerderaggregat',0,'Foerderaggregat','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_ueberlauf_foerderaggregat_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Leapingwehr',1,'Leapingwehr','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_ueberlauf_foerderaggregat_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Streichwehr',2,'Streichwehr','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_pumpenregime (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'alternierend',0,'alternierend','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_pumpenregime (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',1,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_pumpenregime (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'einzeln',2,'einzeln','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_pumpenregime (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'parallel',3,'parallel','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_pumpenregime (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.administration_organisation_organisationstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abwasserverband',0,'Abwasserverband','0',NULL);
INSERT INTO vsadssmini_arrow.administration_organisation_organisationstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bund',1,'Bund','0',NULL);
INSERT INTO vsadssmini_arrow.administration_organisation_organisationstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinde',2,'Gemeinde','0',NULL);
INSERT INTO vsadssmini_arrow.administration_organisation_organisationstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Genossenschaft_Korporation',3,'Genossenschaft Korporation','0',NULL);
INSERT INTO vsadssmini_arrow.administration_organisation_organisationstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kanton',4,'Kanton','0',NULL);
INSERT INTO vsadssmini_arrow.administration_organisation_organisationstyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Privat',5,'Privat','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'abflussloseGrube',0,'abflussloseGrube','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Absturzbauwerk',1,'Absturzbauwerk','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abwasserfaulraum',2,'Abwasserfaulraum','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',3,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ARABauwerk',4,'ARABauwerk','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Be_Entlueftung',5,'Be Entlueftung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Behandlungsanlage',6,'Behandlungsanlage','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bodenablauf',7,'Bodenablauf','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Dachwasserschacht',8,'Dachwasserschacht','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Duekerkammer',9,'Duekerkammer','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Duekeroberhaupt',10,'Duekeroberhaupt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Einlaufschacht',11,'Einlaufschacht','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Einleitstelle_gewaesserrelevant',12,'Einleitstelle gewaesserrelevant','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Einleitstelle_nicht_gewaesserrelevant',13,'Einleitstelle nicht gewaesserrelevant','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Entwaesserungsrinne',14,'Entwaesserungsrinne','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Entwaesserungsrinne_mit_Schlammsack',15,'Entwaesserungsrinne mit Schlammsack','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Faulgrube',16,'Faulgrube','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Fettabscheider',17,'Fettabscheider','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gelaendemulde',18,'Gelaendemulde','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Geleiseschacht',19,'Geleiseschacht','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Geschiebefang',20,'Geschiebefang','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Guellegrube',21,'Guellegrube','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Havariebecken',22,'Havariebecken','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Klaergrube',23,'Klaergrube','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'KLARA',24,'KLARA','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kombischacht',25,'Kombischacht','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kontroll_Einsteigschacht',26,'Kontroll Einsteigschacht','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Leitungsknoten',27,'Leitungsknoten','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Messstelle',28,'Messstelle','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Oelabscheider',29,'Oelabscheider','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Pumpwerk',30,'Pumpwerk','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regenbecken_Durchlaufbecken',31,'Regenbecken Durchlaufbecken','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regenbecken_Fangbecken',32,'Regenbecken Fangbecken','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regenbecken_Fangkanal',33,'Regenbecken Fangkanal','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regenbecken_Regenklaerbecken',34,'Regenbecken Regenklaerbecken','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regenbecken_Regenrueckhaltebecken',35,'Regenbecken Regenrueckhaltebecken','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regenbecken_Regenrueckhaltekanal',36,'Regenbecken Regenrueckhaltekanal','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regenbecken_Stauraumkanal',37,'Regenbecken Stauraumkanal','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regenbecken_Verbundbecken',38,'Regenbecken Verbundbecken','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Regenueberlauf',39,'Regenueberlauf','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schlammsammler',40,'Schlammsammler','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schwimmstoffabscheider',41,'Schwimmstoffabscheider','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'seitlicherZugang',42,'seitlicherZugang','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Spuelschacht',43,'Spuelschacht','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Trennbauwerk',44,'Trennbauwerk','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',45,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Versickerungsanlage',46,'Versickerungsanlage','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Vorbehandlungsanlage',47,'Vorbehandlungsanlage','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_funktion (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Wirbelfallschacht',48,'Wirbelfallschacht','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_nach (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'groesser_6cm',0,'groesser 6cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_nach (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'plusminus_1cm',1,'plusminus 1cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_nach (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'plusminus_3cm',2,'plusminus 3cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_nach (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'plusminus_6cm',3,'plusminus 6cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_nach (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_staukoerper (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_staukoerper (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keiner',1,'keiner','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_staukoerper (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ueberfallwehr',2,'Ueberfallwehr','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_staukoerper (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',3,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_staukoerper (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Venturieinschnuerung',4,'Venturieinschnuerung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenreinigung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Air_Jet',0,'Air Jet','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenreinigung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',1,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenreinigung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine',2,'keine','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenreinigung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Raeumereinrichtung',3,'Raeumereinrichtung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenreinigung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ruehrwerk',4,'Ruehrwerk','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenreinigung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schlaengelrinne',5,'Schlaengelrinne','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenreinigung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schwallspuelung',6,'Schwallspuelung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenreinigung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Spuelkippe',7,'Spuelkippe','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_beckenreinigung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',8,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_direkteinleitung_n_gwssr_gplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja',0,'ja','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_direkteinleitung_n_gwssr_gplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',1,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_direkteinleitung_n_gwssr_gplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_vergleich_letzte_untersuchung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gleich',0,'gleich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_vergleich_letzte_untersuchung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kein_Vergleich_moeglich',1,'kein Vergleich moeglich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_vergleich_letzte_untersuchung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_vergleich_letzte_untersuchung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unklar',3,'unklar','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_vergleich_letzte_untersuchung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Verbesserung',4,'Verbesserung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_vergleich_letzte_untersuchung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Verschlechterung',5,'Verschlechterung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_relevanzmatrix (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja',0,'ja','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_relevanzmatrix (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',1,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_relevanzmatrix (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'dringend',0,'dringend','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keiner',1,'keiner','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kurzfristig',2,'kurzfristig','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'langfristig',3,'langfristig','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'mittelfristig',4,'mittelfristig','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',5,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ausser_Betrieb',0,'ausser Betrieb','0',NULL);
INSERT INTO vsadssmini_arrow.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'in_Betrieb',1,'in Betrieb','0',NULL);
INSERT INTO vsadssmini_arrow.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'tot',2,'tot','0',NULL);
INSERT INTO vsadssmini_arrow.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',3,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.astatus (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'weitere',4,'weitere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_versickerung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja',0,'ja','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_versickerung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',1,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_versickerung_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Asbestzement',1,'Asbestzement','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beton_Normalbeton',2,'Beton Normalbeton','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beton_Ortsbeton',3,'Beton Ortsbeton','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beton_Pressrohrbeton',4,'Beton Pressrohrbeton','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beton_Spezialbeton',5,'Beton Spezialbeton','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beton_unbekannt',6,'Beton unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Faserzement',7,'Faserzement','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gebrannte_Steine',8,'Gebrannte Steine','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Guss_duktil',9,'Guss duktil','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Guss_Grauguss',10,'Guss Grauguss','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kunststoff_Epoxydharz',11,'Kunststoff Epoxydharz','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kunststoff_Hartpolyethylen',12,'Kunststoff Hartpolyethylen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kunststoff_Polyester_GUP',13,'Kunststoff Polyester GUP','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kunststoff_Polyethylen',14,'Kunststoff Polyethylen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kunststoff_Polypropylen',15,'Kunststoff Polypropylen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kunststoff_Polyvinilchlorid',16,'Kunststoff Polyvinilchlorid','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kunststoff_unbekannt',17,'Kunststoff unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Stahl',18,'Stahl','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Stahl_rostfrei',19,'Stahl rostfrei','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Steinzeug',20,'Steinzeug','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ton',21,'Ton','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',22,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_material (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Zement',23,'Zement','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenueberlauf_springt_an (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja',0,'ja','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenueberlauf_springt_an (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',1,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenueberlauf_springt_an (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_informationsquelle (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_informationsquelle (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'GEP_ARA_Einzugsgebiet',1,'GEP ARA Einzugsgebiet','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_informationsquelle (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'GEP_Traegerschaft',2,'GEP Traegerschaft','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_informationsquelle (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',3,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',0,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Z0',1,'Z0','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Z1',2,'Z1','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Z2',3,'Z2','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Z3',4,'Z3','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_baulicherzustand (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Z4',5,'Z4','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_foerderaggregat_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_foerderaggregat_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Druckluftanlage',1,'Druckluftanlage','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_foerderaggregat_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kolbenpumpe',2,'Kolbenpumpe','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_foerderaggregat_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kreiselpumpe',3,'Kreiselpumpe','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_foerderaggregat_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schneckenpumpe',4,'Schneckenpumpe','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_foerderaggregat_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',5,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_foerderaggregat_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Vakuumanlage',6,'Vakuumanlage','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'dringend',0,'dringend','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keiner',1,'keiner','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kurzfristig',2,'kurzfristig','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'langfristig',3,'langfristig','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'mittelfristig',4,'mittelfristig','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_sanierungsbedarf (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',5,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_finanzierung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'oeffentlich',0,'oeffentlich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_finanzierung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'privat',1,'privat','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_finanzierung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M0',0,'M0','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M1',1,'M1','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M2',2,'M2','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M3',3,'M3','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M4',4,'M4','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_prioritaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',5,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_profiltyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Eiprofil',0,'Eiprofil','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_profiltyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kreisprofil',1,'Kreisprofil','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_profiltyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Maulprofil',2,'Maulprofil','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_profiltyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'offenes_Profil',3,'offenes Profil','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_profiltyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Rechteckprofil',4,'Rechteckprofil','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_profiltyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Spezialprofil',5,'Spezialprofil','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_profiltyp (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',6,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_lagebestimmung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'genau',0,'genau','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_lagebestimmung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',1,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_lagebestimmung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ungenau',2,'ungenau','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_aeusserer_aspekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gross',0,'gross','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_aeusserer_aspekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kein',1,'kein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_aeusserer_aspekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Aussage_moeglich',2,'keine Aussage moeglich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_aeusserer_aspekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'klein_mittel',3,'klein mittel','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_aeusserer_aspekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_aeusserer_aspekt (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unklar',5,'unklar','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_trennbauwerk_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_trennbauwerk_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'freie_Aufteilung',1,'freie Aufteilung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_trennbauwerk_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Leapingwehr',2,'Leapingwehr','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_trennbauwerk_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Sekundaerrichtung_geschlossen',3,'Sekundaerrichtung geschlossen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_trennbauwerk_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Streichwehr',4,'Streichwehr','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_trennbauwerk_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',5,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_wasserpflanzen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gross',0,'gross','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_wasserpflanzen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'kein_klein',1,'kein klein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_wasserpflanzen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Aussage_moeglich',2,'keine Aussage moeglich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_wasserpflanzen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'mittel',3,'mittel','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_wasserpflanzen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_einfluss_wasserpflanzen (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unklar',5,'unklar','0',NULL);
INSERT INTO vsadssmini_arrow.administration_organisation_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'aktiv',0,'aktiv','0',NULL);
INSERT INTO vsadssmini_arrow.administration_organisation_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'untergegangen',1,'untergegangen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_reliner_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ganze_Haltung',0,'ganze Haltung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_reliner_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'partiell',1,'partiell','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_reliner_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_immissionsorientierte_berechnung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja',0,'ja','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_immissionsorientierte_berechnung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',1,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_einleitstelle_immissionsorientierte_berechnung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bachwasser',1,'Bachwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'entlastetes_Mischabwasser',2,'entlastetes Mischabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Industrieabwasser',3,'Industrieabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Mischabwasser',4,'Mischabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Niederschlagsabwasser',5,'Niederschlagsabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Reinabwasser',6,'Reinabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schmutzabwasser',7,'Schmutzabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',8,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_zugaenglichkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ueberdeckt',0,'ueberdeckt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_zugaenglichkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',1,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_zugaenglichkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unzugaenglich',2,'unzugaenglich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_knoten_zugaenglichkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'zugaenglich',3,'zugaenglich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_finanzierung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'oeffentlich',0,'oeffentlich','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_finanzierung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'privat',1,'privat','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_finanzierung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abflussvermeidung_Retention_Versickerung',0,'Abflussvermeidung Retention Versickerung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'administrative_Massnahme',1,'administrative Massnahme','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',2,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Aufhebung',3,'Aufhebung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Datenmanagement',4,'Datenmanagement','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Erhaltung_Erneuerung',5,'Erhaltung Erneuerung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Erhaltung_Reinigung',6,'Erhaltung Reinigung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Erhaltung_Renovierung_Reparatur',7,'Erhaltung Renovierung Reparatur','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Erhaltung_unbekannt',8,'Erhaltung unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Fremdwasserreduktion',9,'Fremdwasserreduktion','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Funktionsaenderung',10,'Funktionsaenderung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'GEP_Bearbeitung',11,'GEP Bearbeitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kontrolle_und_Ueberwachung',12,'Kontrolle und Ueberwachung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Massnahme_im_Gewaesser',13,'Massnahme im Gewaesser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Netzerweiterung',14,'Netzerweiterung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Sonderbauwerk_Anpassung',15,'Sonderbauwerk Anpassung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Sonderbauwerk_Neubau',16,'Sonderbauwerk Neubau','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Stoerfallvorsorge',17,'Stoerfallvorsorge','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_massnahme_kategorie (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',18,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_kennlinie_stuetzpunkt_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'geplant',0,'geplant','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_kennlinie_stuetzpunkt_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ist',1,'Ist','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_kennlinie_stuetzpunkt_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ist_optimiert',2,'Ist optimiert','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_versickerung_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja',0,'ja','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_versickerung_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',1,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_versickerung_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenueberlaufbecken_regenbecken_anordnung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Hauptschluss',0,'Hauptschluss','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenueberlaufbecken_regenbecken_anordnung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Nebenschluss',1,'Nebenschluss','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_regenueberlaufbecken_regenbecken_anordnung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_feststoffrueckhalt_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_feststoffrueckhalt_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Buerstenrechen',1,'Buerstenrechen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_feststoffrueckhalt_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Feinrechen',2,'Feinrechen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_feststoffrueckhalt_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Grobrechen',3,'Grobrechen','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_feststoffrueckhalt_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Sieb',4,'Sieb','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_feststoffrueckhalt_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Stauschild',5,'Stauschild','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_feststoffrueckhalt_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Tauchwand',6,'Tauchwand','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_feststoffrueckhalt_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',7,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_rueckstausicherung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_rueckstausicherung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Pumpe',1,'Pumpe','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_rueckstausicherung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Rueckstauklappe',2,'Rueckstauklappe','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_rueckstausicherung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Stauschild',3,'Stauschild','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_rueckstausicherung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_von (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'groesser_6cm',0,'groesser 6cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_von (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'plusminus_1cm',1,'plusminus 1cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_von (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'plusminus_3cm',2,'plusminus 3cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_von (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'plusminus_6cm',3,'plusminus 6cm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_hoehengenauigkeit_von (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',4,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bachwasser',1,'Bachwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'entlastetes_Mischabwasser',2,'entlastetes Mischabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Industrieabwasser',3,'Industrieabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Mischabwasser',4,'Mischabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Niederschlagsabwasser',5,'Niederschlagsabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Reinabwasser',6,'Reinabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schmutzabwasser',7,'Schmutzabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_geplant (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',8,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_zweck (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'beides',0,'beides','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_zweck (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Kostenverteilung',1,'Kostenverteilung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_zweck (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'technischer_Zweck',2,'technischer Zweck','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_messgeraet_zweck (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',3,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.halignment (seq,iliCode,itfCode,dispName,inactive,description) VALUES (0,'Left',0,'Left','0',NULL);
INSERT INTO vsadssmini_arrow.halignment (seq,iliCode,itfCode,dispName,inactive,description) VALUES (1,'Center',1,'Center','0',NULL);
INSERT INTO vsadssmini_arrow.halignment (seq,iliCode,itfCode,dispName,inactive,description) VALUES (2,'Right',2,'Right','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_steuerung_fernwirkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_steuerung_fernwirkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Steuerung',1,'keine Steuerung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_steuerung_fernwirkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'lokale_Steuerung',2,'lokale Steuerung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_steuerung_fernwirkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Uebermittlung_Alarm',3,'Uebermittlung Alarm','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_steuerung_fernwirkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Uebermittlung_Messsignale',4,'Uebermittlung Messsignale','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_steuerung_fernwirkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',5,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_sk_steuerung_fernwirkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Verbundsteuerung',6,'Verbundsteuerung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beckenentleerung',0,'Beckenentleerung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beckenreinigung',1,'Beckenreinigung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Drosselorgan',2,'Drosselorgan','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Feststoffrueckhalt',3,'Feststoffrueckhalt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Foerderaggregat',4,'Foerderaggregat','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Messgeraet',5,'Messgeraet','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Notentlastung',6,'Notentlastung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Rueckstausicherung',7,'Rueckstausicherung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_bauwerkskomponente_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ueberlauf',8,'Ueberlauf','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PAA.andere',0,'PAA.andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PAA.Gewaesser',1,'PAA.Gewaesser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PAA.Hauptsammelkanal',2,'PAA.Hauptsammelkanal','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PAA.Hauptsammelkanal_regional',3,'PAA.Hauptsammelkanal regional','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PAA.Liegenschaftsentwaesserung',4,'PAA.Liegenschaftsentwaesserung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PAA.Sammelkanal',5,'PAA.Sammelkanal','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PAA.Sanierungsleitung',6,'PAA.Sanierungsleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PAA.Strassenentwaesserung',7,'PAA.Strassenentwaesserung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'PAA.unbekannt',8,'PAA.unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SAA.andere',9,'SAA.andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SAA.Liegenschaftsentwaesserung',10,'SAA.Liegenschaftsentwaesserung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SAA.Sanierungsleitung',11,'SAA.Sanierungsleitung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SAA.Strassenentwaesserung',12,'SAA.Strassenentwaesserung','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_funktionhierarchisch (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SAA.unbekannt',13,'SAA.unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_direkteinleitung_in_gewassr_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'ja',0,'ja','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_direkteinleitung_in_gewassr_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nein',1,'nein','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_teileinzugsgebiet_direkteinleitung_in_gewassr_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',2,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bachwasser',1,'Bachwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'entlastetes_Mischabwasser',2,'entlastetes Mischabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Industrieabwasser',3,'Industrieabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Mischabwasser',4,'Mischabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Niederschlagsabwasser',5,'Niederschlagsabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Reinabwasser',6,'Reinabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Schmutzabwasser',7,'Schmutzabwasser','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_nutzungsart_ist (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',8,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_wbw_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',0,'andere','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_wbw_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Feld',1,'Feld','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_wbw_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Sanierungsleitung_Bagger',2,'Sanierungsleitung Bagger','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_wbw_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Sanierungsleitung_Grabenfraese',3,'Sanierungsleitung Grabenfraese','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_wbw_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Strasse',4,'Strasse','0',NULL);
INSERT INTO vsadssmini_arrow.vsadssmini_leitung_wbw_bauart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbekannt',5,'unbekannt','0',NULL);
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','einwohner_dim_ist2','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','schmutzabwasseranfall_ist','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','entlastungsanteil_nh4_n_ist1','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_trennbauwerk','mehrbelastung_ist2','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'knoten_sw_geplantref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_trennbauwerk','mehrbelastung_ist_optimiert2','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','ueberlaufdauer_geplant','ch.ehi.ili2db.unit','h');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'textpos','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'textpos','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'textpos','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'textpos','ch.ehi.ili2db.geomType','POINT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'textpos','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'textpos','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'textpos','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'primaerrichtungref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_einleitstelle','wasserspiegel_hydraulik','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung_text',NULL,'textinhalt','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'bueroref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','einwohner_ist1','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','qan_ist1','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'ausfuehrende_firmaref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','stauraum3','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','fremdwasseranfall_geplant2','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_rohrprofil_geometrie',NULL,'rohrprofilref','ch.ehi.ili2db.foreignKey','vsadssmini_rohrprofil');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_geplant1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','foerderstrommin','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','fremdwasseranfall_geplant','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','ueberlaufdauer_geplant1','ch.ehi.ili2db.unit','h');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_trennbauwerk','stauraum4','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','flaeche_red_dim_geplant','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','nutzinhalt_fangteil','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'perimeter','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'perimeter','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'perimeter','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'perimeter','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'perimeter','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'perimeter','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'perimeter','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','stauraum','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','qab_geplant','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','entlastungsanteil_nh4_n_ist_optimiert1','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'rueckstaukote_ist','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','mehrbelastung_geplant','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'gesamtkosten','ch.ehi.ili2db.unit','CHF');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'symbolori','ch.ehi.ili2db.unit','Angle_Degree');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'sanierungskonzept','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_einleitstelle','biol_oekol_gesamtbeurteilung_bemerkung','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'drosselorgan_oeffnung_ist_optimiert','ch.ehi.ili2db.unit','mm');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','ueberlaufdauer_ist_optimiert','ch.ehi.ili2db.unit','h');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'schmutzabwasseranfall_geplant','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_einleitstelle','auslaufrohr_lichte_hoehe','ch.ehi.ili2db.unit','mm');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_bef_ist1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'abflussbeiwert_rw_geplant','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'ara_nr','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_einleitstelle','q347','ch.ehi.ili2db.unit','m3s');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'traegerschaftref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','einwohner_dim_geplant','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'lichte_breite','ch.ehi.ili2db.unit','mm');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_ueberlauf_foerderaggregat',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'sbw_sw_istref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'sk_trennbauwerkref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_red_geplant1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'abflussbeiwert_sw_geplant','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_dim_geplant1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_ueberlauf_foerderaggregat',NULL,'knotenref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'befestigungsgrad_rw_geplant','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','entlastungsanteil_nh4_n_geplant1','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'einwohnerdichte_ist','ch.ehi.ili2db.unit','EWha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','flaeche_red_ist','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'sohlenkote','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','foerderhoehe_geodaetisch','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','schmutzabwasseranfall_ist2','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','entlastungsfracht_nh4_n_ist_optimiert','ch.ehi.ili2db.unit','kga');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_ueberlauf_foerderaggregat',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme_knotenassoc',NULL,'knotenref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','entlastungsfracht_nh4_n_geplant','ch.ehi.ili2db.unit','kga');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','ueberlaufmenge_ist1','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'naechstes_sbwref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'handlungsbedarf','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','foerderstrommax','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'ueberlauf_kotemax','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','einwohner_dim_geplant2','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'fremdwasseranfall_ist','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','flaeche_dim_geplant2','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'einwohnerdichte_geplant','ch.ehi.ili2db.unit','EWha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'knoten_vonref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','aggregatezahl','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'einleitstelleref1','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','mehrbelastung_ist_optimiert1','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_trennbauwerk','mehrbelastung_geplant2','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'kote_nach','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','qab_ist','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','entlastungsanteil_nh4_n_ist_optimiert','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','flaeche_bef_dim_geplant2','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'rohrprofilref','ch.ehi.ili2db.foreignKey','vsadssmini_rohrprofil');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'hoehe','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','ueberlaufmenge_ist_optimiert1','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'verantwortlich_ausloesungref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','fremdwasseranfall_ist1','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_rohrprofil_geometrie',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'T_Type','ch.ehi.ili2db.types','["vsadssmini_sk_autonome_messstelle","vsadssmini_sk_duekeroberhaupt","vsadssmini_sk_einleitstelle","vsadssmini_sk_pumpwerk","vsadssmini_sk_regenrueckhaltebecken_kanal","vsadssmini_sk_regenueberlauf","vsadssmini_sk_regenueberlaufbecken","vsadssmini_sk_trennbauwerk","vsadssmini_sk_uebrige"]');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'standortgemeinderef','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','schmutzabwasseranfall_geplant1','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','einwohner_geplant1','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_ueberlauf_foerderaggregat',NULL,'knoten_nachref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_einleitstelle','gewaesserspezifische_entlastungsfracht_nh4_n_ist_optimiert','ch.ehi.ili2db.unit','kga');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'reliner_nennweite','ch.ehi.ili2db.unit','mm');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','einwohner_dim_ist','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','flaeche_ist','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'eigentuemerref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','fremdwasseranfall_geplant1','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','qab_ist_optimiert','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','flaeche_red_dim_geplant2','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','flaeche_geplant','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'beckenentleerung_leistung','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','qan_ist_optimiert','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','ueberlaufmenge_geplant1','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'befestigungsgrad_rw_ist','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_einleitstelle','gewaesserspezifische_entlastungsfracht_nh4_n_ist','ch.ehi.ili2db.unit','kga');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('administration_organisation',NULL,'gemeindenummer','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','einwohner_dim_geplant1','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','flaeche_dim_geplant','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'hydr_belastung_ist','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_bef_dim_geplant1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten_text',NULL,'knotenref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'wandrauhigkeit','ch.ehi.ili2db.unit','mm');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_bef_geplant1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_red_dim_geplant1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_trennbauwerk','qan_ist_optimiert2','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten_text',NULL,'textinhalt','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'einwohnerwerte','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','flaeche_red_dim_ist','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'sk_duekeroberhauptref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'leitung_nachref','ch.ehi.ili2db.foreignKey','vsadssmini_leitung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','schmutzabwasseranfall_ist1','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'sbw_rw_geplantref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','entlastungsanteil_nh4_n_ist','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','fremdwasseranfall_ist','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','nutzinhalt','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','flaeche_dim_ist','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'kote_von','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','mehrbelastung_geplant1','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'knoten_rw_istref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'sk_pumpwerkref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','flaeche_bef_geplant','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'ueberlauf_kotemin','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','flaeche_bef_ist','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','ueberlaufdauer_ist_optimiert1','ch.ehi.ili2db.unit','h');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'sbw_sw_geplantref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_rohrprofil',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'ueberlauf_hydrueberfalllaenge','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'notentlastung_kote','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'symbolpos','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'symbolpos','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'symbolpos','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'symbolpos','ch.ehi.ili2db.geomType','POINT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'symbolpos','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'symbolpos','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'symbolpos','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','stauraum1','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'knoten_sw_istref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'foerderaggregat_foerderstrommax_einzeln','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_trennbauwerk','qan_geplant2','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'schmutzabwasseranfall_ist','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_red_ist1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'lage','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'lage','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'lage','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'lage','ch.ehi.ili2db.geomType','POINT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'lage','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'lage','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'lage','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten_text',NULL,'textpos','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten_text',NULL,'textpos','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten_text',NULL,'textpos','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten_text',NULL,'textpos','ch.ehi.ili2db.geomType','POINT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten_text',NULL,'textpos','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten_text',NULL,'textpos','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten_text',NULL,'textpos','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_ist1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','einwohner_dim_ist1','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'lichte_hoehe','ch.ehi.ili2db.unit','mm');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme_leitungassoc',NULL,'massnahme_leitungassocref','ch.ehi.ili2db.foreignKey','vsadssmini_massnahme');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','fremdwasseranfall_geplant3','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_alr',NULL,'massnahmeref','ch.ehi.ili2db.foreignKey','vsadssmini_massnahme');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'feststoffrueckhalt_dimensionierungswert','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten_text',NULL,'textori','ch.ehi.ili2db.unit','Angle_Degree');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','schmutzabwasseranfall_ist3','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','qan_ist','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','stauraum2','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'betreiberref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','qan_geplant1','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'deckelkote','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'abflussbeiwert_sw_ist','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'befestigungsgrad_sw_ist','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','entlastungsanteil_nh4_n_geplant','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_red_dim_ist1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','mehrbelastung_ist','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'ueberlaufnachref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'knoten_nachref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'wiederbeschaffungswert','ch.ehi.ili2db.unit','CHF');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'zufluss','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','ueberlaufdauer_ist','ch.ehi.ili2db.unit','h');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'einleitstelleref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','ueberlaufdauer_ist1','ch.ehi.ili2db.unit','h');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_uebrige','beschrieb','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'fremdwasseranfall_geplant','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'lage','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'lage','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'lage','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'lage','ch.ehi.ili2db.geomType','POINT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'lage','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'lage','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'lage','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'abfluss','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','entlastungsfracht_nh4_n_geplant1','ch.ehi.ili2db.unit','kga');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','mehrbelastung_ist_optimiert','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'feststoffrueckhalt_anspringkote','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung_text',NULL,'textpos','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung_text',NULL,'textpos','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung_text',NULL,'textpos','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung_text',NULL,'textpos','ch.ehi.ili2db.geomType','POINT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung_text',NULL,'textpos','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung_text',NULL,'textpos','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung_text',NULL,'textpos','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_rohrprofil',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','flaeche_red_geplant','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung_text',NULL,'textori','ch.ehi.ili2db.unit','Angle_Degree');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'befestigungsgrad_sw_geplant','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_trennbauwerk','qan_ist2','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'flaeche','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','einwohner_ist','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung_text',NULL,'leitungref','ch.ehi.ili2db.foreignKey','vsadssmini_leitung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','ueberlaufmenge_ist','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','einwohner_geplant','ch.ehi.ili2db.unit','CountedObjects');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'notenlastung_einleitstelleref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'eigentuemerref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','schmutzabwasseranfall_geplant2','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','mehrbelastung_ist1','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','fremdwasseranfall_ist2','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','flaeche_red_dim_ist2','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'betreiberref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','entlastungsfracht_nh4_n_ist_optimiert1','ch.ehi.ili2db.unit','kga');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'sk_regenrueckhaltebecken_kanalref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','ueberlaufmenge_ist_optimiert','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'abflussbegrenzung_ist','ch.ehi.ili2db.unit','lsha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','flaeche_dim_ist2','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'knoten_rw_geplantref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','schmutzabwasseranfall_geplant','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'detailgeometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'detailgeometrie','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'detailgeometrie','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'detailgeometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'detailgeometrie','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'detailgeometrie','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'detailgeometrie','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'dimension1','ch.ehi.ili2db.unit','mm');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','qan_ist_optimiert1','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'datenlieferantref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'foerderaggregat_foerderstrommin_einzeln','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'wiederbeschaffungswert','ch.ehi.ili2db.unit','CHF');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','flaeche_bef_dim_geplant','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'sk_regenueberlaufbeckenref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'stammkarteref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_einleitstelle','gewaesserspezifische_entlastungsfracht_nh4_n_geplant','ch.ehi.ili2db.unit','kga');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','schmutzabwasseranfall_geplant3','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','nutzinhalt_klaerteil','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','entlastungsfracht_nh4_n_ist1','ch.ehi.ili2db.unit','kga');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_dim_ist1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_rohrprofil_geometrie',NULL,'datenherrref','ch.ehi.ili2db.foreignKey','administration_organisation');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt',NULL,'sk_regenueberlaufref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'verweis','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','volumen_pumpensumpf','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','flaeche_bef_dim_ist2','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'linie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'linie','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'linie','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'linie','ch.ehi.ili2db.geomType','LINESTRING');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'linie','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'linie','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'linie','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme_knotenassoc',NULL,'massnahme_knotenassocref','ch.ehi.ili2db.foreignKey','vsadssmini_massnahme');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','entlastungsfracht_nh4_n_ist','ch.ehi.ili2db.unit','kga');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenrueckhaltebecken_kanal','fremdwasseranfall_ist3','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'abflussbeiwert_rw_ist','ch.ehi.ili2db.unit','Percent');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'akten','ch.ehi.ili2db.textKind','MTEXT');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'perimeter','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'perimeter','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'perimeter','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'perimeter','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'perimeter','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'perimeter','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme',NULL,'perimeter','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','qan_geplant','ch.ehi.ili2db.unit','ls');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlauf','ueberlaufmenge_geplant','ch.ehi.ili2db.unit','m3');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'hauptbauwerkref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk',NULL,'paa_knotenref','ch.ehi.ili2db.foreignKey','vsadssmini_knoten');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_pumpwerk','flaeche_bef_dim_ist','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_knoten',NULL,'dimension2','ch.ehi.ili2db.unit','mm');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'abflussbegrenzung_geplant','ch.ehi.ili2db.unit','lsha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'laengeeffektiv','ch.ehi.ili2db.unit','m');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_sk','vsadssmini_sk_regenueberlaufbecken','flaeche_bef_dim_ist1','ch.ehi.ili2db.unit','ha');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_massnahme_leitungassoc',NULL,'leitungref','ch.ehi.ili2db.foreignKey','vsadssmini_leitung');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'verlauf','ch.ehi.ili2db.coordDimension','2');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'verlauf','ch.ehi.ili2db.c1Max','2840000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'verlauf','ch.ehi.ili2db.c2Max','1300000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'verlauf','ch.ehi.ili2db.geomType','LINESTRING');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'verlauf','ch.ehi.ili2db.c1Min','2480000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'verlauf','ch.ehi.ili2db.c2Min','1070000.000');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_leitung',NULL,'verlauf','ch.ehi.ili2db.srid','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet',NULL,'sbw_rw_istref','ch.ehi.ili2db.foreignKey','vsadssmini_sk');
INSERT INTO vsadssmini_arrow.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('vsadssmini_bauwerkskomponente',NULL,'drosselorgan_oeffnung_ist','ch.ehi.ili2db.unit','mm');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_einleitstelle_handlungsbedarf','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_nutzungsart_geplant','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten_nutzungsart_ist','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_einleitstelle_einfluss_aeusserer_aspekt','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_profiltyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('administration_organisation_status','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet_entwaesserungssystem_geplant','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet_entwaesserungssystem_ist','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_messgeraet_messart','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_rohrprofil','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt_status','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_reliner_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('valignment','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_massnahme_prioritaet','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_einleitstelle_einfluss_makroinvertebraten','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('astatus','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_messgeraet_staukoerper','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten_lagegenauigkeit','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_beckenentleerung_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_text','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten_baulicherzustand','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten_funktionhierarchisch','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_material','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_massnahme_kategorie','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet_versickerung_geplant','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_rohrprofil_geometrie','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_einleitstelle_einfluss_hilfsindikatoren','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_funktionhierarchisch','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_foerderaggregat_bauart','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_regenueberlaufbecken_regenbecken_anordnung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten_sanierungsbedarf','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_nutzungsart_ist','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_feststoffrueckhalt_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_informationsquelle','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_baulicherzustand','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_funktionhydraulisch','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_drosselorgan_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('administration_organisation','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_regenrueckhaltebecken_kanal_notueberlauf','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_leckschutz','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten_nutzungsart_geplant','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_wbw_bauart','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet_retention_ist','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_hoehengenauigkeit_von','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('plantyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_massnahme_leitungassoc','ch.ehi.ili2db.tableKind','ASSOCIATION');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_kennlinie_stuetzpunkt','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_regenrueckhaltebecken_kanal_regenbeckn_nrdnung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('halignment','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten_finanzierung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_alr','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_ueberlauf_foerderaggregat_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet_retention_geplant','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_hoehengenauigkeit_nach','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten_zugaenglichkeit','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_massnahme','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_ueberlauf_foerderaggregat','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_einleitstelle_immissionsorientierte_berechnung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_finanzierung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_alr_beseitigung_ist','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_sanierungsbedarf','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_pumpwerk_foerderaggregat_nutzungsart_ist','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_einleitstelle_vergleich_letzte_untersuchung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten_funktion','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_einleitstelle_einfluss_wasserpflanzen','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_messgeraet_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_knoten_text','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_rueckstausicherung_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_steuerung_fernwirkung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_regenueberlauf_springt_an','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_pumpwerk_pumpenregime','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('administration_organisation_organisationstyp','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_alr_sanierungsbedarf','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_einleitstelle_gewaesserart','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_regenueberlauf_wehr_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_einleitstelle_relevanzmatrix','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet_direkteinleitung_n_gwssr_gplant','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_massnahme_knotenassoc','ch.ehi.ili2db.tableKind','ASSOCIATION');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_messgeraet_zweck','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet_direkteinleitung_in_gewassr_ist','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_statuswerte','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_sk_trennbauwerk_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_teileinzugsgebiet_versickerung_ist','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_bauwerkskomponente_beckenreinigung_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_leitung_lagebestimmung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vsadssmini_massnahme_status','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO vsadssmini_arrow.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('VSADSSMINI_2020_2_d_LV95-20201109.ili','2.3','VSADSSMINI_2020_LV95{ Units INTERLIS Base_LV95 SIA405_Base_Abwasser_LV95}','!!@ comment = "VSADSSMINI_2020_2_d_LV95.ili"

INTERLIS 2.3;

MODEL VSADSSMINI_2020_LV95 (de) AT "http://www.vsa.ch/models"
  VERSION "09.11.2020" = 

  IMPORTS UNQUALIFIED INTERLIS;
  IMPORTS Units;
  IMPORTS Base_LV95;
  IMPORTS SIA405_Base_Abwasser_LV95;

!!@ comment = "Copyright 2002 - 2020"
!!@ comment = "Verband Schweizer Abwasser- und Gewässerschutzfachleute (VSA), Zürich www.vsa.ch"

!!@ comment = "Freigegeben für öffentlichen Gebrauch und kommerzielle Anwendung"
!!@ comment = "Sachbearbeiter: Stefan Burckhardt / VSA CC Siedlungsentwässerung"
!!@ comment = " Geprueft mit Compiler Version 5.1.4 (2.10.2020)"


UNIT
  Kilogramm_pro_Jahr [kga] = (kg/Units.a);
  Einwohner_pro_Hektare [EWha] = (Units.CountedObjects/Units.ha);
  Liter_pro_Sekunde_Hektare [lsha] = (SIA405_Base_Abwasser_LV95.ls/Units.ha);

TOPIC VSADSSMini EXTENDS SIA405_Base_Abwasser_LV95.Administration =


DOMAIN


!!@ comment = ""
Number = -99999999.9999 ..  99999999.9999;


!!@ comment = "Erweitert Wertebereich von SIA405 Status Betriebs- und Planungszustand."
Statuswerte EXTENDS SIA405_Base_Abwasser_LV95.Status = (  
!!@ comment = "Erweiterung Basiswerte im Medium, hierarchische Modellierung und Anpassung mit Compiler 4.5.13"
      !!@ comment = "17.7.2015 ausser_Betrieb,   !! fasst ausser_Betrieb und folgende Werte zusammen"
      !!@ comment = "  Reserve !! existiert nicht im Medium Abwasser"
	  !!@ comment = "fasst in_Betrieb und folgende Werte zusammen"
      in_Betrieb (
         provisorisch,
         wird_aufgehoben
      ),
	  !!@ comment = "fasst tot und folgende Werte zusammen"
      tot (
         !!@ comment = "  tot,   !! existiert nicht im Medium Abwasser"
        aufgehoben_nicht_verfuellt,
        aufgehoben_unbekannt,
        verfuellt
      ),
	  !!@ comment = "fasst weitere und folgende Werte zusammen"
      weitere (
         Berechnungsvariante,
         geplant,
         Projekt
      )
    );    
!!@ comment = "neu 17.7.2015 Erweitert Wertebereich von SIA405 Status"
    Status = ALL OF Statuswerte;


!!@ comment = "Wandrauhigkeitsbeiwert nach Prandtl Colebrook (ks), Millimeter [mm]"
Prandtl = 0.00 .. 100.00 [Units.mm];


!!@ comment = "Kilogramm pro Jahr [kg/Jahr]"
Fracht = 0 .. 1000000 [kga];


!!@ comment = "Einwohner pro Hektare [Einwohner / ha]"
Einwohnerdichte = 0 .. 10000 [EWha];


!!@ comment = "Einwohnergleichwert [EGW]"
EGW = 0 .. 300000 [Units.CountedObjects];


!!@ comment = "Einwohner [E]"
E = 0 .. 9999999 [Units.CountedObjects];


!!@ comment = "Gewässerlaufnummer des Gewässerlauf gemäss VECTOR25 Gewässernetz"
GWLNR = TEXT*25;


!!@ comment = "ARA-Nummer gemäss Bundesamt für Umwelt (BAFU)"
ARANr = 1 .. 999999 [Units.CountedObjects];


!!@ comment = "Nummer in der Reihenfolge der X/Y-Tuppel der Rohrprofil.Geometrie"
Reihenfolge = 1 .. 999;


!!@ comment = "[Anzahl Überläufe/Jahr]"
Ueberlaufhaeufigkeit = 0.0 .. 999.9;


!!@ comment = "[Anzahl Aggregate]"
Aggregatezahl = 1 .. 9  [Units.CountedObjects];


!!@ comment = "Millimeter [mm]"
Lichte_Hoehe = 0 .. 99999 [Units.mm];


!!@ comment = "Meter [m], 2 Dezimalstellen"
Foerderhoehe = 0.00 .. 30000.00 [m];


!!@ comment = "Kantonale Bezeichnung des Gewässerabschnittes im Kantonalen Gewässernetz"
GewaesserabschnittsID = TEXT*30;

!!@ comment = "neu Wegleitung GEP-Daten 2020 Datenherr und Datenlieferant als Beziehung zu Organisation statt als Textattribut"
CLASS VSA_BaseClass (ABSTRACT) EXTENDS SIA405_Base_Abwasser_LV95.SIA405_BaseClass =

END VSA_BaseClass;

ASSOCIATION DatenherrAssoc = 
   DatenherrRef (EXTERNAL) -- {1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
   VSA_BaseClass_DatenherrAssocRef -- {0..*} VSA_BaseClass;
END DatenherrAssoc;

ASSOCIATION DatenlieferantAssoc =
   DatenlieferantRef (EXTERNAL) -- {1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
   VSA_BaseClass_DatenlieferantAssocRef -- {0..*} VSA_BaseClass;
END DatenlieferantAssoc;

!!@ comment = "Definition eines Rohrprofils mit Bezeichnung, kann für von verschiedenen Leitungen verwendet werden. Ein Rohrprofil wird nur erfasst, wenn es sich nicht um ein Normalprofil handelt (Leitung.Profiltyp.Spezialprofil oder offenes_Profil). 	Ein Rohrprofil besteht aus den verschiedensten Stützpunkten, welche zusammen die Geometrie des Querschnitts definieren (-> Klasse Rohrprofil_Geometrie)."
CLASS Rohrprofil EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Allgemeine Bemerkungen"
    Bemerkung: TEXT*80;
    Bezeichnung: MANDATORY TEXT*20;
UNIQUE 
    !!@ comment = "UNIQUE Kombination Bezeichnung, DatenherrRef, damit mit VSA-DSS-Mini kompatibel (Wegleitung GEP-Daten 2014)"
    Bezeichnung, DatenherrRef;
END Rohrprofil;

!!@ comment = "Geometrie des Rohrprofils als X/Y-Punkte mit Lichte_Hoehe = 1"
CLASS Rohrprofil_Geometrie EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Reihenfolge der Detailpunkte der Geometriedefinition"
    Reihenfolge: Reihenfolge;
    !!@ comment = "X-Koordinate"
    X: Number;
    !!@ comment = "Y-Koordinate"
    Y: Number;
END Rohrprofil_Geometrie;

!!@ comment = "Komposition"
ASSOCIATION Rohrprofil_Geometrie_RohrprofilAssoc =
  RohrprofilRef  -<#> {1} Rohrprofil;
  Rohrprofil_Geometrie_RohrprofilAssocRef -- {0..*} Rohrprofil_Geometrie;
END Rohrprofil_Geometrie_RohrprofilAssoc;

!!@ comment = "(Punktueller) Ort im Entwässerungsnetz mit baulicher und/oder hydraulischer Funktion"
CLASS Knoten EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Eindeutige Identifikationsnummer der ARA (ARA Nummer des BAFU), in deren Einzugsgebiet der Knoten liegt. Ist auch abzufüllen, wenn der Knoten nicht an die ARA angeschlossen ist. Die Abgrenzung der ARA-Einzugsgebiete ist im Zweifelsfall mit der kantonalen Fachstelle zu klären."
    ARA_Nr: ARANr;
    !!@ comment = "Jahr der Inbetriebsetzung (Schlussabnahme). Falls unbekannt = 1800 setzen (tiefster Wert des Wertebereichs)"
    Baujahr: SIA405_Base_Abwasser_LV95.Jahr;
    !!@ comment = "Zustandsklassen 0 bis 4 gemäss VSA-Richtline ''Erhaltung von Kanalisationen''. Beschreibung des baulichen Zustands des Abwasserbauwerks. Nicht zu verwechseln mit den Sanierungsstufen, welche die Prioritäten der Massnahmen bezeichnen (Attribut Sanierungsbedarf)."
    BaulicherZustand: (     
      unbekannt,
      !!@ comment = "Nicht mehr funktionstüchtig: Das Abwasserbauwerk ist bereits oder demnächst nicht mehr durchgängig: Bauwerk eingestürzt, totale Verwurzelung oder andere Abflusshindernisse. Das Bauwerk verliert Wasser (Exfiltration / mögliche Grundwasserverschmutzung)."
      Z0,
      !!@ comment = "Starke Mängel: Bauliche Schäden, bei welchen die statische Sicherheit, Hydraulik oder Dichtheit nicht mehr gewährleistet ist: Brüche axial oder radial, (Rohr-)deformationen, visuell sichtbare Wassereintritte oder Wasseraustritte, Löcher in der Wand, stark vorstehende seitliche Anschlüsse, starke Verwurzelungen, Wand stark ausgewaschen. Ungeeignetes (Rohr-)material."
      Z1,
      !!@ comment = "Mittlere Mängel: Bauliche Mängel, welche die Statik, Hydraulik oder Dichtheit beeinträchtigen: breite (Rohr-)fugen, nicht verputzte Einläufe, Risse, leichte Abflusshindernisse wie Verkalkungen, vorstehende seitliche Anschlüsse, leichte Wandbeschädigungen, einzelne Wurzeleinwüchse, (Rohr-)wand ausgewaschen usw."
      Z2,
      !!@ comment = "Leichte Mängel: Bauliche Mängel oder Vorkommnisse, welche für die Dichtheit, Hydraulik oder Statik einen unbedeutenden Einfluss haben: breite (Rohr-)fugen, schlecht verputzte seitlichen Anschlüsse, leichte Deformation bei Bauwerken aus Kunststoff, leichte Auswaschungen etc."
      Z3,
      !!@ comment = "Keine Mängel"
      Z4
    );
    !!@ comment = "Allgemeine Bemerkungen"
    Bemerkung: TEXT*80;
    Bezeichnung: MANDATORY TEXT*41;
    !!@ comment = "Kote der Abdeckung des Bauwerks. Bei mehreren Deckeln ist die Kote des Hauptdeckels anzugeben. Falls kein Deckel vorhanden ist, leer lassen."
    Deckelkote: Base_LV95.Hoehe;
    !!@ comment = "Detaillierte Geometrie insbesondere bei Spezialbauwerken. Für Normschächte i.d. R.  Dimension1 und 2 verwenden. Dito bei normierten Versickerungsanlagen.  Kanäle haben normalerweise keine Detailgeometrie."
    Detailgeometrie: Base_LV95.Surface;
    !!@ comment = "Dimension1 des Schachtes (grösstes Innenmass)."
    Dimension1: SIA405_Base_Abwasser_LV95.Abmessung;
    !!@ comment = "Dimension2 des Schachtes (kleinstes Innenmass). Bei runden Schächten wird Dimension2 leer gelassen, bei ovalen abgefüllt. Für eckige Schächte Detailgeometrie verwenden."
    Dimension2: SIA405_Base_Abwasser_LV95.Abmessung;
    !!@ comment = "Finanzierungart (Finanzierung gemäss GschG Art. 60a)."
    Finanzierung: (     
      !!@ comment = "Gesamtheit aller erdverlegten Leitungen und Bauwerke, die über Abwassergebühren gemäss Art. 60a des Gewässerschutzgesetzes finanziert werden"
      oeffentlich,
      !!@ comment = "Gesamtheit aller erdverlegten Leitungen und Bauwerke, die nicht über Abwassergebühren gemäss Art. 60a des Gewässerschutzgesetzes finanziert werden"
      privat,
      unbekannt
    );
    !!@ comment = "Das Attribut ''Funktion'' entscheidet darüber, ob ein Knoten ein Sonderbauwerk ist und welche Stammkarte gegebenenfalls auszufüllen ist. Es ist deshalb wichtig, dass die Funktion korrekt attributiert wird."
    Funktion: (     
      !!@ comment = "Abflusslose Grube"
      abflussloseGrube,
      !!@ comment = "Ein Absturzschacht ist ein spezielles Bauwerk im Kanalisationsnetz zur Überwindung von Höhenunterschieden auf kurze Entfernung bei gleichzeitiger Energieumwandlung"
      Absturzbauwerk,
      !!@ comment = "Abwasserfaulraum: 3 Kammern"
      Abwasserfaulraum,
      !!@ comment = "Nur verwenden, wenn kein anderer Wert zutrifft. Die Funktion des Bauwerkes im Attribut  Bemerkung beschreiben"
      andere,
      !!@ comment = "Es soll das erste Bauwerk der eigentlichen ARA erfasst werden. Allenfalls vorgeschaltete Pumpwerke, Regenbecken oder Regenüberläufe noch als solche erfassen. In VSA-DSS als ARA Bauwerk erfassen."
      ARABauwerk,
      !!@ comment = "Vorrichtung zum gewünschten Luftaustausch in Abwasserbauwerken"
      Be_Entlueftung,
      !!@ comment = "Anlage zur weitergehenden Behandlung von Strassenabwasser (SABA) oder Regenabwasser aus dem Liegenschaftsbereich wie Boden-, Splitt-, Sand- oder technische Filter und künstliche Adsorber. Bauliche Ausprägung als Mulde, (Norm-)Schacht, Spezialbauwerk/Becken oder technische Anlage. Reine Absetzschächte und -becken (=Schlammsammler bzw. Regenklaerbecken) gelten in diesem Sinn nicht als Behandlungsanlagen, für sie sind separate Attribut-Werte vorhanden."
      Behandlungsanlage,
      Bodenablauf,
      !!@ comment = "Schacht im Bereich der Liegenschaftsentwässerung, in den in der Regel Abflussrohre vom Dach einmünden"
      Dachwasserschacht,
      !!@ comment = "Spezialbauwerk bei einem Abwasserdüker zur Entleerung der Leitungen am tiefsten Punkt"
      Duekerkammer,
      !!@ comment = "Bauwerk zur Aufteilung des Abflusses auf mehrere Dükerrohre"
      Duekeroberhaupt,
      !!@ comment = "Ablauf zur Fassung des Oberflächenwasssers  bestehend aus einem Schacht mit einem Aufsatz aus einem Rahmen und einem Rost (VSS, SN 640 356)"
      Einlaufschacht,
      !!@ comment = "Alle  Gewässer-Einleitungen von öffentlichen  und  industriellen  ARA, von Kleinkläranlagen (KLARA) und von öffentlichen Misch- und Regenabwassernetzen sowie Einleitungen von reinen Strassenentwässerungen mit  einer lichten Höhe oder Breite = 30 cm. Als Gewässer im Sinne der Definition gelten alle öffentlichen Gewässer. (Definition und Standardisierung von Kennzahlen für die Abwasserentsorgung, VSA/OKI, 2016)."
      Einleitstelle_gewaesserrelevant,
      !!@ comment = "Alle Gewässer-Einleitungen, die nicht den unter ''Einleitstelle_gewaesserrelevant'' aufgeführte Kriterien entsprechen."
      Einleitstelle_nicht_gewaesserrelevant,
      !!@ comment = "Längliches Bauelement mit geschlitzten Öffnungen zur Aufnahme von abfliessendem Oberflächenwasser"
      Entwaesserungsrinne,
      Entwaesserungsrinne_mit_Schlammsack,
      !!@ comment = "Faulgrube: 2 Kammern"
      Faulgrube,
      !!@ comment = "Abscheideanlage für tierische und pfanzliche Fette und Öle. (SN 592 000:2012)"
      Fettabscheider,
      !!@ comment = "Natürliche oder künstliche Vertiefung im Boden, um abfliessendes Wasser zurückzuhalten"
      Gelaendemulde,
      !!@ comment = "Normschacht zur Entwässerung von Geleiseanlagen"
      Geleiseschacht,
      !!@ comment = "Spezialbauwerk in einem offenen Gewässer zur Aufnahme von im Wasser mitgeführtem Material. Häufig am Übergang zu einem eingedolten Abschnitt"
      Geschiebefang,
      !!@ comment = "Gülle- oder Jauchegrube"
      Guellegrube,
      !!@ comment = "Becken zum Auffangen von wassergefährdenden Stoffen bei einem Unfall oder Störfall."
      Havariebecken,
      !!@ comment = "Eine Klärgrube (1 Kammer) dient der Entwässerung einer Liegenschaft, die nicht an die öffentliche Kanalisation angeschlossen ist. Eine Klärgrube ist üblicherweise ein beckenartiges, unterirdisches Bauwerk, in dem sich die festen Stoffe am Boden absetzen, Klärgruben müssen periodisch geleert werden."
      Klaergrube,
      !!@ comment = "Anlage zur Behandlung von häuslichem Schmutzabwasser mit begrenztem Anschlusswert. (DIN 4045)"
      KLARA,
      !!@ comment = "Gemeinsamer Kontroll_Einsteigschacht für zwei parallel verlaufende Abwasserleitungen, meist eine Schmutz- und eine Regenabwasserleitung."
      Kombischacht,
      !!@ comment = "Einsteig- oder Kontrollschacht für Unterhalts- und Kontrollzwecke (Definition gemäss SIA 190.301 / EN 16323:2014)"
      Kontroll_Einsteigschacht,
      !!@ comment = "Leitungsknoten dienen der Abbildung spezieller topologischer Knoten, die nicht über ein ihnen spezifisch zuweisbares Abwasserbauwerk verfügen. Leitungsknoten sind u.a. zu erfassen bei: a) Vereinigung von mehreren PAA- oder mehreren SAA-Leitungen ohne Schacht, b) Gefälls-, Profil-, Material- oder Baujahrwechsel ohne Schacht, c) Leitungsbeginn ohne Schacht oder d) Leitungsbeginn auf der Entlastungsseite von Sonderbauwerken mit mehreren, hydraulisch getrennten Ausläufen, z.B. bei Regenüberlauf, Regenbecken oder Trennbauwerken."
      Leitungsknoten,
      !!@ comment = "Die Funktion ''Messstelle'' wird nur Knoten zugewiesen, die keine andere Sonderbauwerksfunktion aufweisen (reine Messschächte). Beispielsweise wird einem Überlauf mit Durchflussmessung die Funktion ''Regenueberlauf'' zugewiesen und nicht die Funktion ''Messstelle''. Das Messgerät wird in diesem Fall als Bauwerkskomponente auf der Stammkarte ''Regenüberlauf'' erfasst."
      Messstelle,
      !!@ comment = "Abscheideanlage für mineralische Leichtflüssigkeiten, evtl. mit Koalenzstufe und/oder selbsttätigem Abschluss (SN 592 000:2012)"
      Oelabscheider,
      !!@ comment = "Anlage zum Heben von Abwasser innerhalb eines Kanalnetzes"
      Pumpwerk,
      !!@ comment = "Bauwerk in Mischabwassernetzen zur Absetzung von partikulären Stoffen und zur Speicherung von Mischabwasser (Sekundärwirkung, es können nur kleine Regenmengen gespeichert werden)"
      Regenbecken_Durchlaufbecken,
      !!@ comment = "Regenüberlaufbecken, dass zum Fangen des ersten Schmutzstosses dient."
      Regenbecken_Fangbecken,
      !!@ comment = "Speicherleitung mit oberhalb liegendem Überlauf ins Gewässer."
      Regenbecken_Fangkanal,
      !!@ comment = "Absetzbecken für Regenabwasser im Trennsystem. Auch zu verwenden für Lammellenklärer, jedoch nicht für Becken mit weitergehenden Reinigungsstufen (Boden-/Sandfilter, Adsorber, etc.) --> Behandlungsanlage"
      Regenbecken_Regenklaerbecken,
      !!@ comment = "Speicherraum für Regenabflussspitzen im Misch- oder Regenabwassernetz. Er dient der Entlastung der Kanalisation bei starkem Regen und hat im Gegensatz zu Regenüberlaufbecken keinen Überlauf oder nur einen Notüberlauf zum Gewässer"
      Regenbecken_Regenrueckhaltebecken,
      !!@ comment = "Speicherkanal mit der gleichen Funktionsweise wie das Regenrückhaltebecken."
      Regenbecken_Regenrueckhaltekanal,
      !!@ comment = "Speicherleitung mit unterhalb liegendem Überlauf ins Gewässer"
      Regenbecken_Stauraumkanal,
      !!@ comment = "Kombination von Fangbecken und Klärbecken"
      Regenbecken_Verbundbecken,
      !!@ comment = "Sonderbauwerk, welches Mischabwasser auftrennt und einen Teil davon direkt dem Gewässer zuführt"
      Regenueberlauf,
      !!@ comment = "Abscheideanlage mit Geruchsverschluss (in der Regel Tauchbogen), welche dem Rückhalt und der Entnahme unerwünschter Sinkstoffe dient (Kies, Sand, usw.). Kann als Einlaufschacht mit Rost ausgebildet sein. Auch Schlammfänge (=Abscheideanlagen  ohne Geruchsverschluss) sind als Schlammsammler zu attributieren (SN 592 000)"
      Schlammsammler,
      !!@ comment = "Schlammsammler mit einem verlängerten Tauchbogen oder einer Tauchwand. Wird insbesondere bei Versickerungsanlagen als Vorbehandlung gebraucht"
      Schwimmstoffabscheider,
      !!@ comment = "Ebenerdiger Zugang zu einem Bauwerk"
      seitlicherZugang,
      !!@ comment = "Schacht der zu Spülzwecken benötigt wird"
      Spuelschacht,
      !!@ comment = "Bauwerk, welches Abwasser im System auftrennt, aber nicht aus dem System entlastet. Ausnahme: Vor einem Fangbecken oder Fangkanal wird nach Füllung des Beckenvolumens Mischabwasser über das Trennbauwerk ins Gewässer entlastet. Ein oder mehrere Zuläufe, zwei oder mehr Abläufe."
      Trennbauwerk,
      unbekannt,
      !!@ comment = "Oberirdisches oder unterirdisches Bauwerk, welches zum Zweck der künstlichen Versickerung von Niederschlagswasser erstellt wird. Als Versickerungsanlagen gelten auch bewusst für die Versickerung reservierte Bodenflächen, in welchen eine Schadstoffanreicherung langfristig in Kauf genommen wird. Dies ist in der Regel der Fall, wenn das Verhältnis Entwässerungsfläche zu Versickerungsfläche grösser als 5 ist."
      Versickerungsanlage,
      !!@ comment = "Anlage zur Vorbehandlung von industriellem oder gewerblichem Schmutzabwasser vor der Ableitung zur ARA wie Spalt- oder Flotationsanlagen. Reine Öl- und Fettabscheider sowie Absetzschächte und -becken (=Schlammsammler bzw. Regenklaerbecken) gelten in diesem Sinn nicht als Vorbehandlungsanlagen, für sie sind separate Attribut-Werte vorhanden. Für Regenabwasser-Behandlungsanlagen den Wert ''Behandlungsanlage'' verwenden."
      Vorbehandlungsanlage,
      !!@ comment = "Bauwerk zur möglichst schadlos geführten Ableitung von Wasser über eine gewisse  Höhenstufe. Das Bauwerk besteht aus Drallkammer, Fallrohr, Toskammer und Rezirkulationsbelüftungsrohr"
      Wirbelfallschacht
    );
    !!@ comment = "Abgeleitetes Attribut - Bildungsregel: Alle Knoten, die mit einer PAA-Leitung verbunden sind (Zufluss oder Abfluss) gehören zum PAA Netz. Das Attribut dient der einfachern fachlichen Prüfung, weil viel fachliche Regeln abhängig davon sind, ob es sekundäre oder primäre Abwasseranlagen sind."
    FunktionHierarchisch: (     
      !!@ comment = "Primäre Abwasseranlage"
      PAA,
      !!@ comment = "Sekundäre Abwasseranlage"
      SAA
    );
    !!@ comment = "Lage des Knotens, massgebender Bezugspunkt für die Kanalnetzberechnung. (In der Regel Lage des Pickellochs oder Lage des Trockenwetterauslaufs)"
    Lage: Base_LV95.LKoord;
    !!@ comment = "Quantifizierung der Genauigkeit der Lage des Deckels (Pickelloch)"
    Lagegenauigkeit: (     
      groesser_50cm,
      plusminus_10cm,
      plusminus_3cm,
      plusminus_50cm,
      unbekannt
    );
    !!@ comment = "Abgeleitetes Attribut zur Visualisierung aus Leitung.Nutzungsart_geplant der wegführenden Leitung in Primärrichtung. Definition Werte siehe Leitung"
    Nutzungsart_geplant: (     
      andere,
      Bachwasser,
      entlastetes_Mischabwasser,
      Industrieabwasser,
      Mischabwasser,
      Niederschlagsabwasser,
      Reinabwasser,
      Schmutzabwasser,
      unbekannt
    );
    !!@ comment = "Abgeleitetes Attribut zur Visualisierung aus Leitung.Nutzungsart_geplant der wegführenden Leitung in Primärrichtung. Definition Werte siehe Leitung"
    Nutzungsart_Ist: (     
      andere,
      Bachwasser,
      entlastetes_Mischabwasser,
      Industrieabwasser,
      Mischabwasser,
      Niederschlagsabwasser,
      Reinabwasser,
      Schmutzabwasser,
      unbekannt
    );
    !!@ comment = "OID des zugehörigen Abwasserbauwerks in der VSA-DSS, nur für Modelltransfers"
    OBJ_ID_Abwasserbauwerk: TEXT*16;
    !!@ comment = "OID des Hauptdeckels (wichtig falls mehrere),  nur für Modelltransfers"
    OBJ_ID_Deckel: TEXT*16;
    !!@ comment = "1. Massgebende Rückstaukote bezogen auf den Berechnungsregen (dss)  2. Höhe, unter der innerhalb der Grundstücksentwässerung besondere Massnahmen gegen Rückstau zu treffen sind. (DIN 4045)"
    Rueckstaukote_Ist: Base_LV95.Hoehe;
    !!@ comment = "Dringlichkeitsstufen und Zeithorizont für bauliche Massnahmen gemäss VSA-Richtline ''Erhaltung von Kanalisationen''"
    Sanierungsbedarf: (     
      !!@ comment = "Die Massnahmen sind dringend auszuführen. Sofortmassnahmen wie bei kurzfristig sind zu prüfen. Zeithorizont 3-4 Jahre."
      dringend,
      !!@ comment = "Es sind keine Massnahmen bis zur nächsten Zustandserfassung und Zustandsbeurteilung erforderlich. Zeithorizont >= 10 Jahre."
      keiner,
      !!@ comment = "Die Massnahmen sind sehr dringend und kurzfristig auszuführen. Im Sinne von Sofortmassnahmen können durch provisorische, lokale Reparaturen weitere Schäden temporär verhindert werden. Zeithorizont <= 2 Jahre"
      kurzfristig,
      !!@ comment = "Die Massnahmen können längerfristig geplant werden. Zeithorizont 7-10 Jahre."
      langfristig,
      !!@ comment = "Die Massnahmen sind mittelfristig erforderlich. Zeithorizont 5-7 Jahre."
      mittelfristig,
      unbekannt
    );
    !!@ comment = "Tiefster Punkt des Knotens. Bei Sonderbauwerken tiefster Punkt des Knotens zu dem die Stammkarte gehört, also in der Regel Auslauf Richtung ARA."
    Sohlenkote: Base_LV95.Hoehe;
    !!@ comment = "Betriebs- bzw. Planungszustand des Bauwerks"
    Status: Status;
    !!@ comment = "Default: 90 Grad"
    SymbolOri: 0.0 .. 359.9 CIRCULAR [Units.Angle_Degree];
    !!@ comment = "Möglichkeit der Zugänglichkeit ins Innere eines Abwasserbauwerks für eine Person (nicht für ein Fahrzeug)"
    Zugaenglichkeit: (     
      !!@ comment = "Hier muss man z.B. zuerst graben, bis man  z.B. den Deckel öffnen kann"
      ueberdeckt,
      unbekannt,
      unzugaenglich,
      !!@ comment = "Zugänglich für eine Person (und nicht unbedingt ein Fahrzeug)"
      zugaenglich
    );
    !!@ comment = "Jahr der letzten Zustandserhebung. Wird für die Erhebung der Kennzahlen GEP gebraucht. Kann mit einer Abfrage von Erhaltungsereignis.Zeitpunkt (jüngstes Ereignis) für Erhaltungsereignis.Art = Untersuchung und Status = ausgefuehrt automatisch abgefüllt werden."
    Zustandserhebung_Jahr: SIA405_Base_Abwasser_LV95.Jahr;
UNIQUE 
    !!@ comment = "UNIQUE Kombination Bezeichnung, DatenherrRef, damit mit VSA-DSS-Mini kompatibel (Wegleitung GEP-Daten 2014)"
    Bezeichnung, DatenherrRef;
END Knoten;

CLASS Knoten_Text EXTENDS SIA405_Base_Abwasser_LV95.SIA405_TextPos =
END Knoten_Text;

!!@comment = "Komposition"
ASSOCIATION Knoten_TextAssoc =
  KnotenRef -<#> {1} Knoten;
  Text -- {0 .. *} Knoten_Text;
END Knoten_TextAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Knoten_EigentuemerAssoc =
  EigentuemerRef (EXTERNAL) -- {1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
  Knoten_EigentuemerAssocRef -- {0..*} Knoten;
END Knoten_EigentuemerAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Knoten_BetreiberAssoc =
  BetreiberRef (EXTERNAL) -- {0..1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
  Knoten_BetreiberAssocRef -- {0..*} Knoten;
END Knoten_BetreiberAssoc;

!!@ comment = "Baulich und hydraulisch homogenes, offenes oder geschlossenes Gerinne zur Ableitung von Abwasser"
CLASS Leitung EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Jahr der Inbetriebsetzung (Schlussabnahme). Falls unbekannt = 1800 setzen (tiefster Wert des Wertebereichs)"
    Baujahr: SIA405_Base_Abwasser_LV95.Jahr;
    !!@ comment = "Zustandsklassen 0 bis 4 gemäss VSA-Richtline ''Erhaltung von Kanalisationen''. Beschreibung des baulichen Zustands des Abwasserbauwerks. Nicht zu verwechseln mit den Sanierungsstufen, welche die Prioritäten der Massnahmen bezeichnen (Attribut Sanierungsbedarf)."
    BaulicherZustand: (     
      unbekannt,
      !!@ comment = "Nicht mehr funktionstüchtig: Das Abwasserbauwerk ist bereits oder demnächst nicht mehr durchgängig: Bauwerk eingestürzt, totale Verwurzelung oder andere Abflusshindernisse. Das Bauwerk verliert Wasser (Exfiltration / mögliche Grundwasserverschmutzung)."
      Z0,
      !!@ comment = "Starke Mängel: Bauliche Schäden, bei welchen die statische Sicherheit, Hydraulik oder Dichtheit nicht mehr gewährleistet ist: Brüche axial oder radial, (Rohr-)deformationen, visuell sichtbare Wassereintritte oder Wasseraustritte, Löcher in der Wand, stark vorstehende seitliche Anschlüsse, starke Verwurzelungen, Wand stark ausgewaschen. Ungeeignetes (Rohr-)material."
      Z1,
      !!@ comment = "Mittlere Mängel: Bauliche Mängel, welche die Statik, Hydraulik oder Dichtheit beeinträchtigen: breite (Rohr-)fugen, nicht verputzte Einläufe, Risse, leichte Abflusshindernisse wie Verkalkungen, vorstehende seitliche Anschlüsse, leichte Wandbeschädigungen, einzelne Wurzeleinwüchse, (Rohr-)wand ausgewaschen usw."
      Z2,
      !!@ comment = "Leichte Mängel: Bauliche Mängel oder Vorkommnisse, welche für die Dichtheit, Hydraulik oder Statik einen unbedeutenden Einfluss haben: breite (Rohr-)fugen, schlecht verputzte seitlichen Anschlüsse, leichte Deformation bei Bauwerken aus Kunststoff, leichte Auswaschungen etc."
      Z3,
      !!@ comment = "Keine Mängel"
      Z4
    );
    !!@ comment = "Allgemeine Bemerkungen"
    Bemerkung: TEXT*80;
    !!@ comment = "Einzigartige Bezeichnung für jeden Datenherrn"
    Bezeichnung: MANDATORY TEXT*41;
    !!@ comment = "Finanzierungart (Finanzierung gemäss GschG Art. 60a)."
    Finanzierung: (     
      !!@ comment = "Gesamtheit aller erdverlegten Leitungen und Bauwerke, die über Abwassergebühren gemäss Art. 60a des Gewässerschutzgesetzes finanziert werden"
      oeffentlich,
      !!@ comment = "Gesamtheit aller erdverlegten Leitungen und Bauwerke, die nicht über Abwassergebühren gemäss Art. 60a des Gewässerschutzgesetzes finanziert werden"
      privat,
      unbekannt
    );
    !!@ comment = "Art des Kanals hinsichtlich der hierarchischen  Bedeutung im Entwässerungssystem"
    FunktionHierarchisch: (     
      PAA (
      !!@ comment = "Andere primäre Abwasseranlagen"
        andere,
          !!@ comment = "Erfassung aus Kanalperspektive (z.B. weil hydraulische Berechnung notwendig)"
        Gewaesser,
          !!@ comment = "Zu verwenden bei: a) Ausläufen aus einem Regenüberlauf oder einem Regenbecken. b) Durchmesser > 1000 mm (insbesondere bei längeren Strecken ohne RÜ/RB)"
        Hauptsammelkanal,
          !!@ comment = "Alle Kanäle im Eigentum des ARA-Verbandes oder überkommunale Transportkanäle im Eigentum der Gemeinde"
        Hauptsammelkanal_regional,
          !!@ comment = "Liegenschaftsentwässerung (hydraulisch relevant). Alle Leitungen auf einer Liegenschaft und für die Weiterleitung aus der Liegenschaft bis zum Sammelkanal. Abgrenzung Liegenschaftsentwässerung von Gebäudeentwässerung gemäss Norm ''Planung und Erstellung von Anlagen für die Liegenschaftsentwässerung (SN 592 000)''"
        Liegenschaftsentwaesserung,
          !!@ comment = "Zu verwenden für: a) alle weiteren Leitungen im Eigentum der Gemeinde und öffentlich finanziert oder b) nach Zusammenfluss von Liegenschaftsentwässerung und öffentlicher Strassenentwässerung"
        Sammelkanal,
          !!@ comment = "Entwässerungsleitung (hydraulisch relevant) zum abwassertechnischen Anschluss von abgelegenen Liegenschaften an die Kanalisation, bei deren Planung und Erstellung gewisse Vereinfachungen zulässig sind."
        Sanierungsleitung,
          !!@ comment = "Hydraulische relevante Leitungen, die ausschliesslich der Strassenentwässerung dienen"
        Strassenentwaesserung,
        unbekannt
      ),
      SAA (
           !!@ comment = "Andere sekundäre Abwasseranlage z.B. alle Drainageleitungen und Entwässerungen von Flurwegen"
         andere,
          !!@ comment = "Liegenschaftsentwässerung (hydraulisch nicht relevant). Alle Leitungen auf einer Liegenschaft und für die Weiterleitung aus der Liegenschaft bis zum Sammelkanal. Abgrenzung Liegenschaftsentwässerung von Gebäudeentwässerung gemäss Norm ''Planung und Erstellung von Anlagen für die Liegenschaftsentwässerung (SN 592 000)''"
        Liegenschaftsentwaesserung,
          !!@ comment = "Entwässerungsleitung (hydraulisch nicht relevant) zum abwassertechnischen Anschluss von abgelegenen Liegenschaften an die Kanalisation, bei deren Erstellung gewisse Vereinfachungen zulässig sind."
        Sanierungsleitung,
          !!@ comment = "Hydraulische nicht relevante Leitungen, die ausschliesslich der Strassenentwässerung dienen"
        Strassenentwaesserung,
        unbekannt  !!@ comment = "Hydraulische nicht relevante Leitungen, die ausschliesslich der Strassenentwässerung dienen"
      )
    );
    !!@ comment = "Art des Kanals hinsichtlich hydraulischer Ausführung"
    FunktionHydraulisch: (     
      andere,
      !!@ comment = "Kanal, welcher Wasser aus Drainageleitungen transportiert"
      Drainagetransportleitung,
      !!@ comment = "Kanal mit vermindertem Querschnitt zur bewussten Begrenzung, resp. Verminderung des Abflusses. Die Funktionsweise basiert auf Abflussverhältnissen unter Druck."
      Drosselleitung,
      !!@ comment = "Geschlossenes Leitungssystem zur Unterfahrung eines Hindernisses als Abwasserdruckleitung."
      Duekerleitung,
      !!@ comment = "Die Freispiegelleitung ist eine Rohrleitung, in der das Wasser gemäss dem Gesetz der Schwerkraft von einem höher gelegenen Anfangspunkt zu einem tiefer gelegenen Endpunkt gelangt. (arb)"
      Freispiegelleitung,
      !!@ comment = "Druckleitung im Anschluss an ein Pumpwerk"
      Pumpendruckleitung,
      !!@ comment = "1. Erdverlegte Leitung zur Sammlung und Ableitung von Hang- und Sickerwasser (SN 592 000) 2. Drainageleitung mit undichten Stossfugen, geschlitzten Rohren oder wasserdurchlässigem Rohrmaterial zur Entwässerung des Baugrundes. (arb)"
      Sickerleitung,
      !!@ comment = "Zur bewussten Rückhaltung von Abwassermengen dimensionierte Leitung bei einem Regenrückhalte-, einem Fang- oder einem Stauraumkanal"
      Speicherleitung,
      !!@ comment = "Leitung mit spezieller Funktion zum Spülen einer Entwässerungsanlage"
      Spuelleitung,
      unbekannt,
      Vakuumleitung,
      !!@ comment = "Versickerungsleitungen - als Gegenstück zur Sickerleitung - werden im Besonderen bei unterirdischen Versickerungsanlagen benötigt."
      Versickerungsleitung
    );
    !!@ comment = "Höhengenauigkeit der Kote beim Leitungsende"
    Hoehengenauigkeit_nach: (     
      groesser_6cm,
      plusminus_1cm,
      plusminus_3cm,
      plusminus_6cm,
      unbekannt
    );
    !!@ comment = "Höhengenauigkeit der Kote beim Leitungsanfang"
    Hoehengenauigkeit_von: (     
      groesser_6cm,
      plusminus_1cm,
      plusminus_3cm,
      plusminus_6cm,
      unbekannt
    );
    !!@ comment = "Dimensionierungsabfluss geteilt durch Normalabflusskapazität der Leitung [%]."
    Hydr_Belastung_Ist: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Sohlenkote beim Leitungsende. Falls Kote unbekannt ist, interpolieren und im Attribut ''Hoehengenauigkeit_nach'' entsprechend dokumentieren."
    Kote_nach: Base_LV95.Hoehe;
    !!@ comment = "Sohlenkote beim Leitungsanfang. Falls Kote unbekannt ist, interpolieren und im Attribut ''Hoehengenauigkeit_von'' entsprechend dokumentieren."
    Kote_von: Base_LV95.Hoehe;
    !!@ comment = "Tatsächliche schräge Länge (d.h. nicht in horizontale Ebene projiziert)  inklusive Kanalkrümmungen"
    LaengeEffektiv: 0.00 .. 30000.00 [m];
    !!@ comment = "Definiert die Lagegenauigkeit der Verlaufspunkte."
    Lagebestimmung: (     
      !!@ comment = "+/- 10 cm, bei der Lagebestimmung aus unterschiedlichen Messungen das Dreifache, d.h. +/- 30 cm (Norm SIA405)"
      genau,
      unbekannt,
      !!@ comment = "Siehe genau"
      ungenau
    );
    !!@ comment = "Doppelwandrohr oder anderes System zum Schutz vor Austritt in Grundwasserschutzzonen."
    Leckschutz: (     
      nicht_vorhanden,
      unbekannt,
      vorhanden
    );
    !!@ comment = "Maximale Innenbreite des Rohrprofils. Eingebaute Liner sind nicht zu berücksichtigen (-> Reliner_Nennweite)."
    Lichte_Breite: SIA405_Base_Abwasser_LV95.Abmessung;
    !!@ comment = "Maximale Innenhöhe des Rohrprofiles. Eingebaute Liner sind nicht zu berücksichtigen -> Reliner_Nennweite)."
    Lichte_Hoehe: Lichte_Hoehe;
    !!@ comment = "Rohrmaterial"
    Material: (     
      andere,
      Asbestzement,
      Beton_Normalbeton,
      Beton_Ortsbeton,
      Beton_Pressrohrbeton,
      Beton_Spezialbeton,
      Beton_unbekannt,
      Faserzement,
      Gebrannte_Steine,
      Guss_duktil,
      Guss_Grauguss,
      Kunststoff_Epoxydharz,
      Kunststoff_Hartpolyethylen,
      Kunststoff_Polyester_GUP,
      Kunststoff_Polyethylen,
      Kunststoff_Polypropylen,
      !!@ comment = "Ein Polymerisatkunststoff, der hart, weich oder niedrig­molekular eingestellt werden kann. In der Abwassertechnik als Rohstoff für Rohre verwendet. (arb)"
      Kunststoff_Polyvinilchlorid,
      !!@ comment = "Kunststoff unbekannter Art"
      Kunststoff_unbekannt,
      Stahl,
      Stahl_rostfrei,
      Steinzeug,
      Ton,
      unbekannt,
      Zement
    );
    !!@ comment = "Durch das Konzept vorgesehene Nutzung (vergleiche auch Nutzungsart_Ist)"
    Nutzungsart_geplant: (     
      !!@ comment = "Z.B. auch Zugang, Be- und Entlüftung"
      andere,
      !!@ comment = "Wasser eines Fliessgewässers, das gemäss seinem natürlichen Zustand oberflächlich, aber an einigen Orten auch in unterirdischen Leitungen abfliesst."
      Bachwasser,
      !!@ comment = "Wasser aus einem Entlastungsbauwerk, welches zum Vorfluter geführt wird. In diesen Kanal darf kein Schmutzabwasser eingeleitet werden."
      entlastetes_Mischabwasser,
      !!@ comment = "Unter Industrieabwasser werden alle Abwässer verstanden, die bei Produktions- und Verarbeitungsprozessen in der Industrie anfallen. Industrieabwässer müssen i.d.R. vorbehandelt werden, bevor sie in öffentliche Kläranlagen eingeleitet werden können (siehe Indirekteinleiter). Bei direkter Einleitung in Gewässer (siehe Direkteinleiter) ist eine umfangreiche Reinigung in speziellen werkseigenen Kläranlagen erforderlich."
      Industrieabwasser,
      !!@ comment = "1. Mischung von Schmutz- und Regenabwasser, die gemeinsam abgeleitet werden 2. Abwasser welches aus einer Mischung von Schmutzabwasser und Regenabwasser besteht"
      Mischabwasser,
      !!@ comment = "Wasser aus natürlichem Niederschlag, das nicht durch Gebrauch verunreinigt wurde. Die Zuordnung zu verschmutztem oder unverschmutztem Abwasser erfolgt nach der Gewässerschutzgesetzgebung bzw. nach Anleitung der VSA-Richtlinie ''Abwasserentsorgung bei Regenwetter''"
      Niederschlagsabwasser,
      !!@ comment = "Sicker-, Grund-, Quell- und Brunnenwasser sowie Kühlwasser aus Durchlaufkühlungen. Gemäss Gewässerschutzgesetz gilt Reinabwasser als unverschmutztes Abwasser  (SN 592 000)."
      Reinabwasser,
      !!@ comment = "Durch Gebrauch verändertes Wasser (häusliches, gewerbliches oder industrielles Abwasser), das in eine Entwässerungsanlage eingeleitet und einer Abwasserbehandlung zugeführt werden muss. Schmutzabwasser gilt als verschmutztes Abwasser im Sinne des Gewässerschutzgesetzes (SN 592 000)"
      Schmutzabwasser,
      unbekannt
    );
    !!@ comment = "Für primäre Abwasseranlagen gilt: Heute zulässige Nutzung. Für sekundäre Abwasseranlagen gilt: Heute tatsächliche Nutzung"
    Nutzungsart_Ist: (     
      !!@ comment = "Z.B. auch Zugang, Be- und Entlüftung"
      andere,
      !!@ comment = "Wasser eines Fliessgewässers, das gemäss seinem natürlichen Zustand oberflächlich, aber an einigen Orten auch in unterirdischen Leitungen abfliesst."
      Bachwasser,
      !!@ comment = "Wasser aus einem Entlastungsbauwerk, welches zum Vorfluter geführt wird. In diesen Kanal darf kein Schmutzabwasser eingeleitet werden."
      entlastetes_Mischabwasser,
      !!@ comment = "Unter Industrieabwasser werden alle Abwässer verstanden, die bei Produktions- und Verarbeitungsprozessen in der Industrie anfallen. Industrieabwässer müssen i.d.R. vorbehandelt werden, bevor sie in öffentliche Kläranlagen eingeleitet werden können (siehe Indirekteinleiter). Bei direkter Einleitung in Gewässer (siehe Direkteinleiter) ist eine umfangreiche Reinigung in speziellen werkseigenen Kläranlagen erforderlich."
      Industrieabwasser,
      !!@ comment = "1. Mischung von Schmutz- und Regenabwasser, die gemeinsam abgeleitet werden 2. Abwasser welches aus einer Mischung von Schmutzabwasser und Regenabwasser besteht"
      Mischabwasser,
      !!@ comment = "Wasser aus natürlichem Niederschlag, das nicht durch Gebrauch verunreinigt wurde. Die Zuordnung zu verschmutztem oder unverschmutztem Abwasser erfolgt nach der Gewässerschutzgesetzgebung bzw. nach Anleitung der VSA-Richtlinie ''Abwasserentsorgung bei Regenwetter''"
      Niederschlagsabwasser,
      !!@ comment = "Sicker-, Grund-, Quell- und Brunnenwasser sowie Kühlwasser aus Durchlaufkühlungen. Gemäss Gewässerschutzgesetz gilt Reinabwasser als unverschmutztes Abwasser (SN 592 000)."
      Reinabwasser,
      !!@ comment = "Durch Gebrauch verändertes Wasser (häusliches, gewerbliches oder industrielles Abwasser), das in eine Entwässerungsanlage eingeleitet und einer Abwasserbehandlung zugeführt werden muss. Schmutzabwasser gilt als verschmutztes Abwasser im Sinne des Gewässerschutzgesetzes (SN 592 000)"
      Schmutzabwasser,
      unbekannt
    );
    !!@ comment = "OID des zugehörigen Abwasserbauwerks (Kanal), nur gebraucht beim Modelltransfer"
    OBJ_ID_Abwasserbauwerk: TEXT*16;
    !!@ comment = "OID des zugehörigen nachHaltungspunkts in der VSA-DSS, nur gebraucht beim Modelltransfer"
    OBJ_ID_nachHaltungspunkt: TEXT*16;
    !!@ comment = "OID des zugehörigen vonHaltungspunkts in der VSA-DSS, nur gebraucht beim Modelltransfer"
    OBJ_ID_vonHaltungspunkt: TEXT*16;
    !!@ comment = "Typ des Profils"
    Profiltyp: (     
      !!@ comment = "Nur für Norm-Eiprofile gemäss DIN 4263 mit Höhenbreitenverhältnis von 1.5 verwenden. Andere Eiprofile, auch solche mit Einbauten, sind als „Spezialprofil“ zu attributieren und die Profildefinition ist mitzuliefern."
      Eiprofil,
      !!@ comment = "Nur für reine Kreisprofile ohne Trockenwetterrinne oder andere Einbauten verwenden. Sonst als „Spezialprofil“ attributieren und die Profildefinition mitliefern."
      Kreisprofil,
      !!@ comment = "Nur für Norm-Maulprofile gemäss DIN 4263 verwenden. Abweichende Varianten, auch solche mit Einbauten, sind als „Spezialprofil“ zu attributieren und die Profildefinition ist mitzuliefern."
      Maulprofil,
      !!@ comment = "Für offene Profile. Profildefinition mitliefern"
      offenes_Profil,
      !!@ comment = "Nur für reine Rechteckprofile ohne Trockenwetterrinne oder andere Einbauten verwenden. Sonst als „Spezialprofil“ attributieren und die Profildefinition mitliefern."
      Rechteckprofil,
      !!@ comment = "Für geschlossene nicht-Normprofile. Profildefinition mitliefern."
      Spezialprofil,
      unbekannt
    );
    !!@ comment = "Art des Relinings"
    Reliner_Art: (     
      ganze_Haltung,
      partiell,
      unbekannt
    );
    !!@ comment = "Lichte Höhe mit eingebautem Liner (=Lichte Höhe des ursprünglichen Rohrprofils minus doppelte Wandstärke des Liners)."
    Reliner_Nennweite: Lichte_Hoehe;
    !!@ comment = "Dringlichkeitsstufen und Zeithorizont für bauliche Massnahmen gemäss VSA-Richtline ''Erhaltung von Kanalisationen''"
    Sanierungsbedarf: (     
      !!@ comment = "Die Massnahmen sind dringend auszuführen. Sofortmassnahmen wie bei kurzfristig sind zu prüfen. Zeithorizont 3-4 Jahre."
      dringend,
      !!@ comment = "Es sind keine Massnahmen bis zur nächsten Zustandserfassung und Zustandsbeurteilung erforderlich. Zeithorizont >= 10 Jahre."
      keiner,
      !!@ comment = "Die Massnahmen sind sehr dringend und kurzfristig auszuführen. Im Sinne von Sofortmassnahmen können durch provisorische, lokale Reparaturen weitere Schäden temporär verhindert werden. Zeithorizont <= 2 Jahre"
      kurzfristig,
      !!@ comment = "Die Massnahmen können längerfristig geplant werden. Zeithorizont 7-10 Jahre."
      langfristig,
      !!@ comment = "Die Massnahmen sind mittelfristig erforderlich. Zeithorizont 5-7 Jahre."
      mittelfristig,
      unbekannt
    );
    !!@ comment = "Betriebs- bzw. Planungszustand des Bauwerks"
    Status: Status;
    !!@ comment = "Anfangs-, Knick- und Endpunkte der Leitung"
    Verlauf: Base_LV95.Polyline;
    !!@ comment = "Hydraulische Kenngrösse zur Beschreibung der Beschaffenheit der Kanalwandung. Beiwert für die Formeln nach Prandtl-Colebrook (ks oder kb)"
    Wandrauhigkeit: Prandtl;
    !!@ comment = "Basisjahr für die Kalkulation des Wiederbeschaffungswerts (siehe auch Attribut Wiederbeschaffungswert)"
    WBW_Basisjahr: SIA405_Base_Abwasser_LV95.Jahr;
    !!@ comment = "Grobe Einteilung der Bauart des Abwasserbauwerks als Inputwert für die Berechnung des Wiederbeschaffungswerts."
    WBW_Bauart: (     
      andere,
      !!@ comment = "Im Feld (Profiltypen für Grabenarbeiten nach Norm SIA 190)"
      Feld,
      !!@ comment = "Bei Sanierungsleitungen, die mit einem Bagger gebaut wurden"
      Sanierungsleitung_Bagger,
      !!@ comment = "Bei Sanierungsleitungen, die mit einer Grabenfräse gebaut wurden"
      Sanierungsleitung_Grabenfraese,
      !!@ comment = "In der Strasse (Profiltypen für Grabenarbeiten nach Norm SIA 190)"
      Strasse,
      unbekannt
    );
    !!@ comment = "Wiederbeschaffungswert des Bauwerks. Zusätzlich muss auch das Attribut WBW_Basisjahr erfasst werden"
    Wiederbeschaffungswert: 0.00 .. 99999999.99 [Units.CHF];
    !!@ comment = "Jahr der letzten Zustandserhebung. Wird für die Erhebung der Kennzahlen GEP gebraucht. Kann mit einer Abfrage von Erhaltungsereignis.Zeitpunkt (jüngstes Ereignis) für Erhaltungsereignis.Art = Untersuchung und Status = ausgefuehrt automatisch abgefüllt werden."
    Zustandserhebung_Jahr: SIA405_Base_Abwasser_LV95.Jahr;
UNIQUE 
    !!@ comment = "UNIQUE Kombination Bezeichnung, DatenherrRef, damit mit VSA-DSS-Mini kompatibel (Wegleitung GEP-Daten 2014)"
    Bezeichnung, DatenherrRef;
END Leitung;

CLASS Leitung_Text EXTENDS SIA405_Base_Abwasser_LV95.SIA405_TextPos =
END Leitung_Text;

!!@comment = "Komposition"
ASSOCIATION Leitung_TextAssoc =
  LeitungRef -<#> {1} Leitung;
  Text -- {0 .. *} Leitung_Text;
END Leitung_TextAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Leitung_Knoten_nachAssoc =
  Knoten_nachRef  -- {0..1} Knoten;
  Leitung_Knoten_nachAssocRef -- {0..*} Leitung;
END Leitung_Knoten_nachAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Leitung_Knoten_vonAssoc =
  Knoten_vonRef  -- {0..1} Knoten;
  Leitung_Knoten_vonAssocRef -- {0..*} Leitung;
END Leitung_Knoten_vonAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Leitung_Leitung_nachAssoc =
  Leitung_nachRef  -- {0..1} Leitung;
  Leitung_Leitung_nachAssocRef -- {0..*} Leitung;
END Leitung_Leitung_nachAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Leitung_EigentuemerAssoc =
  EigentuemerRef (EXTERNAL) -- {1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
  Leitung_EigentuemerAssocRef -- {0..*} Leitung;
END Leitung_EigentuemerAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Leitung_BetreiberAssoc =
  BetreiberRef (EXTERNAL) -- {0..1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
  Leitung_BetreiberAssocRef -- {0..*} Leitung;
END Leitung_BetreiberAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Leitung_RohrprofilAssoc =
  RohrprofilRef  -- {0..1} Rohrprofil;
  Leitung_RohrprofilAssocRef -- {0..*} Leitung;
END Leitung_RohrprofilAssoc;

!!@ comment = "Stammkarte (Superklasse), Attribute siehe Subklassen"
CLASS SK (ABSTRACT) EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Plan Nr. der Ausführungsdokumentation. Kurzbeschrieb weiterer Akten (Betriebsanleitung vom …, etc.)"
    Akten: MTEXT*255;
    Bemerkung: TEXT*80;
    !!@ comment = "Für die Quellen stehen die angegebenen Möglichkeiten zur Verfügung."
    Informationsquelle: (     
      andere,
      GEP_ARA_Einzugsgebiet,
      GEP_Traegerschaft,
      unbekannt
    );
    !!@ comment = "Sachbearbeiter, der die Stammkarte erstellt hat."
    Sachbearbeiter: TEXT*50;
    !!@ comment = "Strassenname oder Ortsbezeichnung  zum Bauwerk"
    Standortname: TEXT*50;
    !!@ comment = "Im Gegensatz zum Attribut Steuerung in den VSA-DSS-Klassen Ueberlauf und Absperr_Drosselorgan bezieht sich das vorliegende Attribut auf die gesamte Steuerung/Alarmierung des Sonderbauwerks."
    Steuerung_Fernwirkung: (     
      andere,
      keine_Steuerung,
      lokale_Steuerung,
      Uebermittlung_Alarm,
      Uebermittlung_Messsignale,
      unbekannt,
      Verbundsteuerung
    );
    !!@ comment = "Basisjahr für die Kalkulation des Wiederbeschaffungswerts (siehe auch Attribut Wiederbeschaffungswert)"
    WBW_Basisjahr: SIA405_Base_Abwasser_LV95.Jahr;
    !!@ comment = "Wiederbeschaffungswert des Bauwerks. Zusätzlich muss auch das Attribut WBW_Basisjahr erfasst werden"
    Wiederbeschaffungswert: 0.00 .. 99999999.99 [Units.CHF];
END SK;

!!@ comment = "Assoziation"
ASSOCIATION SK_HauptbauwerkAssoc =
  HauptbauwerkRef  -- {0..1} SK;
  SK_HauptbauwerkAssocRef -- {0..*} SK;
END SK_HauptbauwerkAssoc;

!!@ comment = "Assoziation"
ASSOCIATION SK_PAA_KnotenAssoc =
  PAA_KnotenRef  -- {1} Knoten;
  SK_PAA_KnotenAssocRef -- {0..1} SK;
END SK_PAA_KnotenAssoc;

!!@ comment = "Assoziation"
ASSOCIATION SK_StandortgemeindeAssoc =
  StandortgemeindeRef (EXTERNAL) -- {0..1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
  SK_StandortgemeindeAssocRef -- {0..*} SK;
END SK_StandortgemeindeAssoc;

!!@ comment = "Assoziation"
ASSOCIATION SK_Naechstes_SBWAssoc =
  Naechstes_SBWRef  -- {0..1} SK;
  SK_Naechstes_SBWAssocRef -- {0..*} SK;
END SK_Naechstes_SBWAssoc;

!!@ comment = "Assoziation"
ASSOCIATION SK_BueroAssoc =
  BueroRef (EXTERNAL) -- {1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
  SK_BueroAssocRef -- {0..*} SK;
END SK_BueroAssoc;

!!@ comment = "Topologische Verbindung von zwei Knoten zur Abbildung von Wehren und Pumpen"
CLASS Ueberlauf_Foerderaggregat EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Art des Überlaufs bzw. Förderaggregats"
    Art: (     
      Foerderaggregat,
      Leapingwehr,
      Streichwehr
    );
    Bezeichnung: MANDATORY TEXT*41;
UNIQUE 
    !!@ comment = "UNIQUE Kombination Bezeichnung, DatenherrRef, damit mit VSA-DSS-Mini kompatibel (Wegleitung GEP-Daten 2014)"
    Bezeichnung, DatenherrRef;
END Ueberlauf_Foerderaggregat;

!!@ comment = "Assoziation"
ASSOCIATION Ueberlauf_Foerderaggregat_KnotenAssoc =
  KnotenRef  -- {1} Knoten;
  Ueberlauf_Foerderaggregat_KnotenAssocRef -- {0..*} Ueberlauf_Foerderaggregat;
END Ueberlauf_Foerderaggregat_KnotenAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Ueberlauf_Foerderaggregat_Knoten_nachAssoc =
  Knoten_nachRef  -- {1} Knoten;
  Ueberlauf_Foerderaggregat_Knoten_nachAssocRef -- {0..*} Ueberlauf_Foerderaggregat;
END Ueberlauf_Foerderaggregat_Knoten_nachAssoc;

!!@ comment = "Grösstmögliche zusammenhängende Fläche, von der das darauf anfallende Abwasser an den gleichen Punkt im Kanalnetz entwässert und die ein einheitliches Entwässerungssystem aufweist. Pro Teileinzugsgebiet kann je ein separater Schmutzabwasser- und ein Regenabwasseranschlusspunkt für den Ist- und den Planungszustand definiert werden."
CLASS Teileinzugsgebiet EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Abflussbegrenzung, falls eine entsprechende Auflage aus dem Entwässerungskonzept vorliegt. Dieses Attribut hat Auflagecharakter. Es ist verbindlich für die Beurteilung von Baugesuchen"
    Abflussbegrenzung_geplant: 0.0 .. 999.9 [lsha];
    !!@ comment = "Abflussbegrenzung, falls eine entsprechende Auflage bereits umgesetzt ist."
    Abflussbegrenzung_Ist: 0.0 .. 999.9 [lsha];
    !!@ comment = "Abflussbeiwert für den Niederschlagsabwasseranschluss im Planungszustand"
    Abflussbeiwert_RW_geplant: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Abflussbeiwert für den Niederschlagsabwasseranschluss im Ist-Zustand"
    Abflussbeiwert_RW_Ist: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Abflussbeiwert für den Schmutz- oder Mischabwasseranschluss im Planungszustand"
    Abflussbeiwert_SW_geplant: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Abflussbeiwert für den Schmutz- oder Mischabwasseranschluss im Ist-Zustand"
    Abflussbeiwert_SW_Ist: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Befestigungsgrad für den Niederschlagsabwasseranschluss im Planungszustand"
    Befestigungsgrad_RW_geplant: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Befestigungsgrad für den Niederschlagsabwasseranschluss im Ist-Zustand"
    Befestigungsgrad_RW_Ist: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Befestigungsgrad für den Schmutz- oder Mischabwasseranschluss im Planungszustand"
    Befestigungsgrad_SW_geplant: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Befestigungsgrad für den Schmutz- oder Mischabwasseranschluss im Ist-Zustand"
    Befestigungsgrad_SW_Ist: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Allgemeine Bemerkungen"
    Bemerkung: TEXT*80;
    Bezeichnung: MANDATORY TEXT*20;
    !!@ comment = "Das Niederschlagsabwasser wird in Zukunft ganz oder teilweise über eine SAA-Leitung in ein Gewässer eingeleitet"
    Direkteinleitung_in_Gewaesser_geplant: (     
      ja,
      nein,
      unbekannt
    );
    !!@ comment = "Das Niederschlagsabwasser wird ganz oder teilweise über eine SAA-Leitung in ein Gewässer eingeleitet"
    Direkteinleitung_in_Gewaesser_Ist: (     
      ja,
      nein,
      unbekannt
    );
    !!@ comment = "Dichte der (physischen) Einwohner im Planungszustand"
    Einwohnerdichte_geplant: Einwohnerdichte;
    !!@ comment = "Dichte der (physischen) Einwohner im Ist-Zustand"
    Einwohnerdichte_Ist: Einwohnerdichte;
    !!@ comment = "Entwässerungsart im Planungszustand (nach Umsetzung des Entwässerungskonzepts). Dieses Attribut hat Auflagecharakter. Es ist verbindlich für die Beurteilung von Baugesuchen"
    Entwaesserungssystem_geplant: (     
      !!@ comment = "Drainierte Flächen ausserhalb Siedlungsgebiet, die an die Siedlungsentwässerung angeschlossen sind"
      Drainagesystem,
      !!@ comment = "Schmutzabwasser und Regenabwasser – soweit sie nicht versickert oder verdunstet werden – sind an das Mischabwassernetz anzuschliessen. Verbindung zu SW/MW-Knoten obligatorisch, Verbindung zu RW-Knoten nicht zulässig."
      Mischsystem,
      !!@ comment = "Im Unterschied zum reinen Trennsystem ist beim modifizierten System neben dem Regenabwasser von nicht überdachten havariegefährdeten Flächen ein weiterer (i.d.R. behandlungsbedürftiger) Teil des Regenabwassers zur ARA abzuleiten. Verbindung zu SW/MW-Knoten ist obligatorisch. Verbindung zu RW-Knoten zulässig."
      ModifiziertesSystem,
      !!@ comment = "Teileinzugsgebiet, das entwässert wird, aber (auch in Zukunft) nicht an eine PAA angeschlossen ist. Z.B. eine Fläche, die über eine SAA direkt in ein Gewässer entwässert wird, oder eine Fläche mit Versickerung über die Schulter. Keine Verbindung mit dem Kanalnetz zulässig."
      nicht_angeschlossen,
      !!@ comment = "Fläche innerhalb des öffentlichen Kanalisationsbereichs, die auch in Zukunft nicht erschlossen wird (seltener Fall). Keine Verbindung mit dem Kanalnetz zulässig."
      nicht_entwaessert,
      !!@ comment = "Entwässerungssystem, üblicherweise bestehend aus zwei Leitungs-/Kanalsystemen für die getrennte Ableitung von Schmutz- und Regenabwasser. Das Schmutzabwasser sowie das Regenabwasser von nicht überdachten havariegefährdeten Flächen sind an das Schmutzabwassernetz anzuschliessen, das übrige Regenabwasser – soweit es nicht versickert oder verdunstet wird – an das Regenabwassernetz. Verbindung zu einem SW/MW-Knoten oder RW-Knoten ist obligatorisch. Verbindung zu zweitem Knoten (RW bzw. SW/MW-Knoten) ist zulässig."
      Trennsystem,
      !!@ comment = "Dieser Wert ist nur bei einer noch nicht abgeschlossenen GEP-Bearbeitung zulässig. Keine Regeln bezüglich Verbindung zum Kanalnetz."
      unbekannt,
      !!@ comment = "Ist zu vergeben, wenn Teileinzugsgebiete im Trennsystem entwässert sind (siehe Beschreibung zu diesem Wert), die PAA-Regenabwasserleitung, an die das Teileinzugsgebiet angeschlossen ist, aber weiter unten ins Mischabwassernetz mündet und dies auch in Zukunft nicht ändern wird."
      vorbereitetes_Trennsystem
    );
    !!@ comment = "Effektive Entwässerungsart im Ist-Zustand"
    Entwaesserungssystem_Ist: (     
      !!@ comment = "Drainierte Flächen ausserhalb Siedlungsgebiet, die an die Siedlungsentwässerung angeschlossen sind"
      Drainagesystem,
      !!@ comment = "Schmutzabwasser und Regenabwasser – soweit sie nicht versickert oder verdunstet werden – sind an das Mischabwassernetz angeschlossen. Verbindung zu SW/MW-Knoten obligatorisch, Verbindung zu RW-Knoten nicht zulässig."
      Mischsystem,
      !!@ comment = "Im Unterschied zum reinen Trennsystem wird beim modifizierten System neben dem Regenabwasser von nicht überdachten havariegefährdeten Flächen ein weiterer Teil des Regenabwassers zur ARA abgeleitet. Verbindung zu SW/MW-Knoten ist obligatorisch. Verbindung zu RW-Knoten zulässig."
      ModifiziertesSystem,
      !!@ comment = "Teileinzugsgebiet das entwässert wird, aber nicht an eine PAA angeschlossen ist. Z.B. eine Fläche, die über eine SAA direkt in ein Gewässer entwässert wird, oder eine Fläche mit Versickerung über die Schulter. Keine Verbindung mit dem Kanalnetz zulässig."
      nicht_angeschlossen,
      !!@ comment = "Entwässerungstechnisch (noch) nicht erschlossene Fläche innerhalb des öffentlichen Kanalisationsbereichs. Z.B. noch nicht überbaute Liegenschaft innerhalb der Bauzone. Keine Verbindung mit dem Kanalnetz zulässig."
      nicht_entwaessert,
      !!@ comment = "Entwässerungssystem, üblicherweise bestehend aus zwei Leitungs-/Kanalsystemen für die getrennte Ableitung von Schmutz- und Regenabwasser. Das Schmutzabwasser sowie das Regenabwasser von nicht überdachten havariegefährdeten Flächen sind an das Schmutzabwassernetz angeschlossen, das übrige Regenabwasser – soweit es nicht versickert oder verdunstet wird – an das Regenabwassernetz. Verbindung zu einem SW/MW-Knoten oder RW-Knoten ist obligatorisch. Verbindung zu zweitem Knoten (RW bzw. SW/MW-Knoten) ist zulässig."
      Trennsystem,
      !!@ comment = "Das Entwässerungssystem ist noch nicht bekannt. Dieser Wert ist nur bei einer noch nicht abgeschlossenen GEP-Bearbeitung zulässig. Keine Regeln bezüglich Verbindung zum Kanalnetz."
      unbekannt,
      !!@ comment = "Ist zu vergeben, wenn Teileinzugsgebiete im Trennsystem entwässert sind (siehe Beschreibung zu diesem Wert), die PAA-Regenabwasserleitung, an die das Teileinzugsgebiet angeschlossen ist, aber weiter unten ins Mischabwassernetz mündet."
      vorbereitetes_Trennsystem
    );
    !!@ comment = "Redundantes Attribut Flaeche, welches die aus dem Perimeter errechnete Flaeche [ha] enthält"
    Flaeche: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Mittlerer Fremdwasseranfall, der im Planungszustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird."
    Fremdwasseranfall_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Mittlerer Fremdwasseranfall, der im Ist-Zustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird"
    Fremdwasseranfall_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Begrenzungspunkte des Teileinzugsgebiets"
    Perimeter: Base_LV95.Surface;
    !!@ comment = "Das Regen- oder Mischabwasser wird in Zukunft über Rückhalteeinrichtungen verzögert ins Kanalnetz eingeleitet."
    Retention_geplant: (     
      ja,
      nein,
      unbekannt
    );
    !!@ comment = "Das Regen- oder Mischabwasser wird über Rückhalteeinrichtungen verzögert ins Kanalnetz eingeleitet."
    Retention_Ist: (     
      ja,
      nein,
      unbekannt
    );
    !!@ comment = "Mittlerer Schmutzabwasseranfall, der im Planungszustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird."
    Schmutzabwasseranfall_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Mittlerer Schmutzabwasseranfall, der im Ist-Zustand in die Schmutz- oder Mischabwasserkanalisation eingeleitet wird"
    Schmutzabwasseranfall_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Beschriftungsposition des Teileinzugsgebiets"
    TextPos: Base_LV95.LKoord;
    !!@ comment = "Das Niederschlagsabwasser wird in Zukunft ganz oder teilweise einer Versickerungsanlage zugeführt"
    Versickerung_geplant: (     
      ja,
      nein,
      unbekannt
    );
    !!@ comment = "Das Niederschlagsabwasser wird ganz oder teilweise einer Versickerungsanlage zugeführt"
    Versickerung_Ist: (     
      ja,
      nein,
      unbekannt
    );
UNIQUE 
    !!@ comment = "UNIQUE Kombination Bezeichnung, DatenherrRef, damit mit VSA-DSS-Mini kompatibel (Wegleitung GEP-Daten 2014)"
    Bezeichnung, DatenherrRef;
END Teileinzugsgebiet;

!!@ comment = "Assoziation"
ASSOCIATION Teileinzugsgebiet_Knoten_RW_IstAssoc =
  Knoten_RW_IstRef  -- {0..1} Knoten;
  Teileinzugsgebiet_Knoten_RW_IstAssocRef -- {0..*} Teileinzugsgebiet;
END Teileinzugsgebiet_Knoten_RW_IstAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Teileinzugsgebiet_Knoten_RW_geplantAssoc =
  Knoten_RW_geplantRef  -- {0..1} Knoten;
  Teileinzugsgebiet_Knoten_RW_geplantAssocRef -- {0..*} Teileinzugsgebiet;
END Teileinzugsgebiet_Knoten_RW_geplantAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Teileinzugsgebiet_Knoten_SW_IstAssoc =
  Knoten_SW_IstRef  -- {0..1} Knoten;
  Teileinzugsgebiet_Knoten_SW_IstAssocRef -- {0..*} Teileinzugsgebiet;
END Teileinzugsgebiet_Knoten_SW_IstAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Teileinzugsgebiet_Knoten_SW_geplantAssoc =
  Knoten_SW_geplantRef  -- {0..1} Knoten;
  Teileinzugsgebiet_Knoten_SW_geplantAssocRef -- {0..*} Teileinzugsgebiet;
END Teileinzugsgebiet_Knoten_SW_geplantAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Teileinzugsgebiet_SBW_SW_IstAssoc =
  SBW_SW_IstRef  -- {0..1} SK;
  Teileinzugsgebiet_SBW_SW_IstAssocRef -- {0..*} Teileinzugsgebiet;
END Teileinzugsgebiet_SBW_SW_IstAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Teileinzugsgebiet_SBW_SW_geplantAssoc =
  SBW_SW_geplantRef  -- {0..1} SK;
  Teileinzugsgebiet_SBW_SW_geplantAssocRef -- {0..*} Teileinzugsgebiet;
END Teileinzugsgebiet_SBW_SW_geplantAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Teileinzugsgebiet_SBW_RW_IstAssoc =
  SBW_RW_IstRef  -- {0..1} SK;
  Teileinzugsgebiet_SBW_RW_IstAssocRef -- {0..*} Teileinzugsgebiet;
END Teileinzugsgebiet_SBW_RW_IstAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Teileinzugsgebiet_SBW_RW_geplantAssoc =
  SBW_RW_geplantRef  -- {0..1} SK;
  Teileinzugsgebiet_SBW_RW_geplantAssocRef -- {0..*} Teileinzugsgebiet;
END Teileinzugsgebiet_SBW_RW_geplantAssoc;

!!@ comment = "Stammkarte Autonome Messstelle: Die Funktion ''Autonome Messstelle'' wird nur Knoten zugewiesen, die keine andere Sonderbauwerksfunktion aufweisen (reine Messschächte). Beispielsweise wird einem Regenüberlauf mit Durchflussmessung die Funktion ''Regenüberlauf'' zugewiesen und nicht die Funktion ''Autonome Messstelle''. Das Messgerät wird in diesem Fall als Bauwerkskomponente auf der Stammkarte ''Regenüberlauf'' erfasst."
CLASS SK_Autonome_Messstelle EXTENDS SK =  
  ATTRIBUTE
END SK_Autonome_Messstelle;

!!@ comment = "Stammkarte Duekeroberhaupt: Als Dükeroberhaupt wird das Einlauf-Bauwerk des Dükers bezeichnet, wo normalerweise die Abwassermengen auf die verschiedenen Leitungssysteme zur Unterquerung eines Hindernisses aufgeteilt werden. Dieses Bauwerk wird in einer Stammkarte erfasst. Für die Dükerleitungen und das Auslaufbauwerk ist keine spezielle, über die Kanalnetzdaten hinausgehende Dokumentation vorgesehen. Falls im Dükeroberhaupt Mischabwasser entlastet wird, ist die Stammkarte Regenüberlauf auszufüllen. Die Aufteilung der Weiterleitungsmenge auf die verschiedenen Dükerrohre wird, falls vorhanden, mittels der Bauwerkskomponente Überlauf in dieser Stammkarte dokumentiert."
CLASS SK_Duekeroberhaupt EXTENDS SK =  
  ATTRIBUTE
END SK_Duekeroberhaupt;

!!@ comment = "Stammkarte Einleitstelle: Einleitstellen in Gewässer aus Entlastungsanlagen (Regenüberläufen, Regenüberlaufbecken, Notentlastungen von Pumpwerken) und aus Trennsystemen des primären Abwassernetzes werden in einer Stammkarte erfasst. Bei Bedarf kann auch eine Stammkarte für Einleitstellen von sekundären Leitungsnetzen ausgefüllt werden. Dafür muss die Einleitstelle in den Kanalnetzdaten mit der Funktion ''Einleitstelle_gewaesserrelevant'' erfasst werden"
CLASS SK_Einleitstelle EXTENDS SK =  
  ATTRIBUTE
    !!@ comment = "Sachbearbeiter Firma oder Verwaltung (kann auch Operateur sein bei Untersuchung)"
    Ausfuehrender: TEXT*50;
    !!@ comment = "Maximale Innenhöhe des Auslaufes. Hilft bei der Identifikation der richtigen Einleitstelle im Feld."
    Auslaufrohr_Lichte_Hoehe: Lichte_Hoehe;
    !!@ comment = "Wichtige Bemerkungen zur biologisch-ökologischen Gesamtbeurteilung aus Sicht des Bearbeiters."
    Biol_oekol_Gesamtbeurteilung_Bemerkung: MTEXT*255;
    !!@ comment = "Datum der letzten Untersuchung, falls vorhanden. Das Datum der aktuellen Untersuchung wird im Attribut Datum_Untersuchung (VSA-DSS-Mini) bzw. Zeitpunkt (VSA-DSS) erfasst."
    Datum_letzte_Untersuchung: INTERLIS_1_DATE;
    !!@ comment = "Das Datum der aktuellen Untersuchung muss ausgefüllt werden."
    Datum_Untersuchung: INTERLIS_1_DATE;
    !!@ comment = "Resultiert aus dem Vergleich des äusseren Aspekts unterhalb und oberhalb der Einleitstelle"
    Einfluss_Aeusserer_Aspekt: (     
      gross,
      kein,
      keine_Aussage_moeglich,
      klein_mittel,
      unbekannt,
      unklar
    );
    !!@ comment = "Nur für stehende Gewässer"
    Einfluss_Hilfsindikatoren: (     
      gross,
      kein_klein,
      keine_Aussage_moeglich,
      mittel,
      unbekannt,
      unklar
    );
    !!@ comment = "Nur für Fliessgewässer. Resultiert aus dem Vergleich der Makroinvertebraten unterhalb und oberhalb der Einleitstelle gemäss dem Modul Gewässeruntersuchung der VSA-Richtlinie Abwasserbewirtschaftung bei Regenwetter. Deshalb nicht zu verwechseln mit den aufgehobenen Attributen Makroinvertebraten_oberhalb, _Einleitung und _unterhalb."
    Einfluss_Makroinvertebraten: (     
      gross,
      kein_klein,
      keine_Aussage_moeglich,
      mittel,
      unbekannt,
      unklar
    );
    !!@ comment = "Nur für stehende Gewässer"
    Einfluss_Wasserpflanzen: (     
      gross,
      kein_klein,
      keine_Aussage_moeglich,
      mittel,
      unbekannt,
      unklar
    );
    !!@ comment = "gemäss Tabelle 5.1 des Moduls STORM der Richtlinie ''Abwasserbewirtschaftung bei Regenwetter'' des VSA (2019)"
    Gewaesserart: (     
      Fluss_Stau,
      Groesseres_Fliessgewaesser,
      Grosser_Mittellandbach,
      Grosser_See,
      Grosser_Voralpenbach,
      Grosses_Fliessgewaesser,
      Kleiner_Mittellandbach,
      Kleiner_See,
      Kleiner_Voralpenbach,
      Quellgewaesser,
      unbekannt
    );
    !!@ comment = "gemäss Basismodul Kapitel 8.4 der Richtlinie ''Abwasserbewirtschaftung bei Regenwetter'' des VSA (2019)"
    Gewaesserspezifische_Entlastungsfracht_NH4_N_geplant: Fracht;
    !!@ comment = "gemäss Basismodul Kapitel 8.4 der Richtlinie ''Abwasserbewirtschaftung bei Regenwetter'' des VSA (2019)"
    Gewaesserspezifische_Entlastungsfracht_NH4_N_Ist: Fracht;
    !!@ comment = "gemäss Basismodul Kapitel 8.4 der Richtlinie ''Abwasserbewirtschaftung bei Regenwetter'' des VSA (2019)"
    Gewaesserspezifische_Entlastungsfracht_NH4_N_Ist_optimiert: Fracht;
    !!@ comment = "Handlungsbedarf resultierend aus der Beeinträchtigung der Einleitstelle auf das Gewässer, der zu einer Massnahme im Massnahmenplan führt. Das Attribut dient auch zur Ableitung der ''Gesamtbeeintraechtigung'' im MGDM 129.1 des BAFU, solange dieses dort noch geführt wird."
    Handlungsbedarf: (     
      ja_kurzfristig,
      ja_laengerfristig,
      keine_Aussage_moeglich,
      nein,
      Status_klaeren,
      unbekannt
    );
    !!@ comment = "Immissionsorientierte Berechnung vorhanden."
    Immissionsorientierte_Berechnung: (     
      ja,
      nein,
      unbekannt
    );
    !!@ comment = "Gewässername gemäss kantonalen Vorgaben"
    Oberflaechengewaesser: TEXT*20;
    !!@ comment = "OID der zugehörigen Biol_oekol_Gesamtbeurteilung in der VSA-DSS, nur für Modelltransfers"
    OBJ_ID_Biol_oekol_Gesamtbeurteilung: TEXT*16;
    !!@ comment = "Menge aus hydrologischen Jahrbüchern. Fehlt diese Angabe in den Jahrbüchern, ist eine Menge zu bestimmen."
    Q347: 0.000 .. 10000.000 [SIA405_Base_Abwasser_LV95.m3s];
    !!@ comment = "Relevantes Gefälle [%] bei der Einleitstelle (für STORM Berechnung). Falls unbekannt muss das Gefälle im Feld oder aufgrund von Plangrundlagen bestimmt werden"
    relevantes_Gefaelle: 0 .. 1000;
    !!@ comment = "Relevanzmatrix gemäss den Vorgaben in der Richtlinie ''Abwasserentsorgung bei Regenwetter'', Modul STORM des VSA (2019)"
    Relevanzmatrix: (     
      ja,
      nein,
      unbekannt
    );
    !!@ comment = "Die Veränderung der Gesamtbeurteilung und eventuelle massgebende veränderte Untersuchungsresultate gegenüber der letzten Untersuchung müssen dokumentiert werden."
    Vergleich_letzte_Untersuchung: (     
      gleich,
      kein_Vergleich_moeglich,
      unbekannt,
      unklar,
      Verbesserung,
      Verschlechterung
    );
    !!@ comment = "Wasserspiegelkote für die hydraulische Berechnung (IST-Zustand). Berechneter Wasserspiegel bei der Einleitstelle. Wo nichts anders gefordert, ist der Wasserspiegel bei einem HQ30 einzusetzen."
    Wasserspiegel_Hydraulik: Base_LV95.Hoehe;
END SK_Einleitstelle;

!!@ comment = "Assoziation"
ASSOCIATION SK_Einleitstelle_Ausfuehrende_FirmaAssoc =
  Ausfuehrende_FirmaRef (EXTERNAL) -- {0..1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
  SK_Einleitstelle_Ausfuehrende_FirmaAssocRef -- {0..*} SK_Einleitstelle;
END SK_Einleitstelle_Ausfuehrende_FirmaAssoc;

!!@ comment = "Stammkarte Pumpwerk: Anlage zum Heben von Abwasser innerhalb eines Kanalnetzes."
CLASS SK_Pumpwerk EXTENDS SK =  
  ATTRIBUTE
    !!@ comment = "Anzahl Förderaggregate"
    Aggregatezahl: Aggregatezahl;
    !!@ comment = "Anzahl Einwohner im direkten Einzugsgebiet als informativer Wert. Der massgebende Schmutzabwasseranfall ist im gleichnamigen entsprechenden Attribut anzugeben."
    Einwohner_Dim_geplant: EGW;
    !!@ comment = "Anzahl Einwohner im direkten Einzugsgebiet (Dimensionierung) als informativer Wert. Der massgebende Schmutzabwasseranfall ist im gleichnamigen entsprechenden Attribut anzugeben."
    Einwohner_Dim_Ist: EGW;
    !!@ comment = "Umfasst die befestigte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene befestigte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_bef_Dim_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Umfasst die befestigte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene befestigte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_bef_Dim_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Das Dimensionierungseinzugsgebiet umfasst die Bruttofläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken"
    Flaeche_Dim_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Das Dimensionierungseinzugsgebiet umfasst die Bruttofläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken"
    Flaeche_Dim_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Umfasst die reduzierte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene reduzierte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_red_Dim_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Umfasst die reduzierte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene reduzierte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_red_Dim_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Nutzungsart_Ist des gepumpten Abwassers. Wird automatisch abgeleitet aus Nutzungsart der wegführenden Leitung. Nur in VSA-DSS-Mini vorhanden."
    Foerderaggregat_Nutzungsart_Ist: (     
      andere,
      !!@ comment = "Wasser eines Fliessgewässers, das gemäss seinem natürlichen Zustand oberflächlich, aber an einigen Orten auch in unterirdischen Leitungen abfliesst."
      Bachwasser,
      !!@ comment = "Wasser aus einem Entlastungsbauwerk, welches zum Vorfluter geführt wird. In diesen Kanal darf kein Schmutzabwasser eingeleitet werden."
      entlastetes_Mischabwasser,
      !!@ comment = "Unter Industrieabwasser werden alle Abwässer verstanden, die bei Produktions- und Verarbeitungsprozessen in der Industrie anfallen.Industrieabwässer müssen i.d.R. vorbehandelt werden, bevor sie in öffentliche Kläranlagen eingeleitet werden können (siehe Indirekteinleiter). Bei direkter Einleitung in Gewässer (siehe Direkteinleiter) ist eine umfangreiche Reinigung in speziellen werkseigenen Kläranlagen erforderlich."
      Industrieabwasser,
      !!@ comment = "1. Mischung von Schmutz- und Regenabwasser, die gemeinsam abgeleitet werden 2. Abwasser welches aus einer Mischung von Schmutzabwasser und Regenabwasser besteht"
      Mischabwasser,
      !!@ comment = "Wasser aus natürlichem Niederschlag, das nicht durch Gebrauch verunreinigt wurde. Die Zuordnung zu verschmutztem oder unverschmutztem Abwasser erfolgt nach der Gewässerschutzgesetzgebung bzw. nach Anleitung der VSA-Richtlinie ''Abwasserentsorgung bei Regenwetter''"
      Niederschlagsabwasser,
      !!@ comment = "Sicker-, Grund-, Quell- und Brunnenwasser sowie Kühlwasser aus Durchlaufkühlungen. Gemäss Gewässerschutzgesetz gilt Reinabwasser als unverschmutztes Abwasser  (SN 592 000)."
      Reinabwasser,
      !!@ comment = "Durch Gebrauch verändertes Wasser (häusliches, gewerbliches oder industrielles Abwasser), das in eine Entwässerungsanlage eingeleitet und einer Abwasserbehandlung zugeführt werden muss. Schmutzabwasser gilt als verschmutztes Abwasser im Sinne des Gewässerschutzgesetzes (SN 592 000)"
      Schmutzabwasser,
      unbekannt
    );
    Foerderhoehe_geodaetisch: Foerderhoehe;
    !!@ comment = "Maximaler Förderstrom der Pumpen (gesamtes Bauwerk). Tritt in der Regel bei der minimalen Förderhöhe ein."
    FoerderstromMax: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Minimaler Förderstrom der Pumpen zusammen (gesamtes Bauwerk). Tritt in der Regel bei der maximalen Förderhöhe ein."
    FoerderstromMin: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Totaler Fremdwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Fremdwasseranfall_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Totaler Fremdwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Fremdwasseranfall_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Bei speziellen Betriebsarten ist die Funktion separat zu dokumentieren und der Stammkarte beizulegen."
    Pumpenregime: (     
      alternierend,
      andere,
      einzeln,
      parallel,
      unbekannt
    );
    !!@ comment = "Totaler Schmutzabwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Schmutzabwasseranfall_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Totaler Schmutzabwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Schmutzabwasseranfall_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Speicherinhalt im Becken und im Zulauf zwischen Wehrkrone und dem Wasserspiegel bei Qan. Bei Regenbeckenüberlaufbecken im Nebenschluss ist der Stauraum beim vorgelagerten Trennbauwerk bzw. Regenüberlauf zu erfassen (vgl. Erläuterungen Inhalt_Fangteil reps. _Klaerteil). Bei Pumpen: Speicherinhalt im Zulaufkanal unter dem Wasserspiegel beim Einschalten der Pumpe (höchstes Einschaltniveau bei mehreren Pumpen)"
    Stauraum: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Volumen des Pumpensumpfs von der Sohle bis zur maximal möglichen Wasserspiegellage (inkl. Kanalspeichervolumen im Zulaufkanal)."
    Volumen_Pumpensumpf: 0.00 .. 10000000.00 [Units.m3];
END SK_Pumpwerk;

!!@ comment = "Stammkarte Regenueberlauf (RÜ): Bauwerk zur Entlastung hoher Mischabwasserabflussspitzen aus dem Kanalnetz ohne vorherige Behandlung in einem Becken. Heute werden dafür teilweise auch die Begriffe Hochwasserentlastung, Regenwasserentlastung, Mischwasserüberlauf, etc. verwendet. Zukünftig soll nur noch die Bezeichnung ''Regenüberlauf'' verwendet werden. Dabei wird nicht unterschieden zwischen Regenüberlauf, Spitzenentlastung, Notüberlauf (nicht zu verwechseln mit einer Notentlastung in einem Pumpwerk, die nur eine Bauwerkskomponente dieses Pumpwerks ist). Ob eine Regenüberlauf im Normalbetrieb effektiv anspringt, oder nur bei einem Betriebsversagen, wird mit dem Attribut ''springt an'' auf der Stammkarte erfasst."
CLASS SK_Regenueberlauf EXTENDS SK =  
  ATTRIBUTE
    !!@ comment = "Anzahl Einwohner im direkten Einzugsgebiet als informativer Wert. Der massgebende Schmutzabwasseranfall ist im gleichnamigen entsprechenden Attribut anzugeben."
    Einwohner_geplant: EGW;
    !!@ comment = "Anzahl Einwohner im direkten Einzugsgebiet als informativer Wert. Der massgebende Schmutzabwasseranfall ist im gleichnamigen entsprechenden Attribut anzugeben."
    Einwohner_Ist: EGW;
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsanteil_NH4_N_geplant: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsanteil_NH4_N_Ist: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsanteil_NH4_N_Ist_optimiert: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsfracht_NH4_N_geplant: Fracht;
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsfracht_NH4_N_Ist: Fracht;
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsfracht_NH4_N_Ist_optimiert: Fracht;
    !!@ comment = "Befestigte Fläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene befestigte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_bef_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Befestigte Fläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene befestigte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_bef_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Bruttofläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken."
    Flaeche_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Bruttofläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken."
    Flaeche_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Reduzierte Fläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene reduzierte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_red_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Reduzierte Fläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene reduzierte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_red_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Totaler Fremdwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Fremdwasseranfall_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Totaler Fremdwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Fremdwasseranfall_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Optimale Mehrbelastung nach der Umsetzung der Massnahmen."
    Mehrbelastung_geplant: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Mehrbelastung der untenliegenden Kanäle beim Dimensionierungsereignis = 100 * (Qab – Qan) / Qan 	[%]. Verhältnis zwischen der abgeleiteten Abwassermengen Richtung ARA beim Anspringen des Entlastungsbauwerkes (Qan) und Qab (Abwassermenge, welche beim Dimensionierungsereignis (z=5) weiter im Kanalnetz Richtung Abwasserreinigungsanlage abgeleitet wird). Beispiel: Qan = 100 l/s, Qab = 150 l/s -> Mehrbelastung = 50%"
    Mehrbelastung_Ist: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Optimale Mehrbelastung im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Mehrbelastung_Ist_optimiert: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Optimale Menge nach der Umsetzung der Massnahmen."
    Qan_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Qan im heutigen Zustand, Ist-Wert aufgrund von Blechöffnungen, Drosselstrecken, etc. Qan ist die Abwassermenge, welche beim Anspringen des Überlaufs weiter im Kanalnetz Richtung Abwasserreinigungsanlage abgeleitet wird. Wassermenge bei welcher der Überlauf tatsächlich anspringt (Ist-Zustand)"
    Qan_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Optimale Menge im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Qan_Ist_optimiert: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Totaler Schmutzabwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Schmutzabwasseranfall_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Totaler Schmutzabwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Schmutzabwasseranfall_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Angabe, ob die Entlastung beim Dimensionierungsereignis anspringt"
    Springt_an: (     
      ja,
      nein,
      unbekannt
    );
    !!@ comment = "Speicherinhalt im Becken und im Zulauf zwischen Wehrkrone und dem Wasserspiegel bei Qan. Bei Regenbeckenüberlaufbecken im Nebenschluss ist der Stauraum beim vorgelagerten Trennbauwerk bzw. Regenüberlauf zu erfassen (vgl. Erläuterungen Inhalt_Fangteil reps. _Klaerteil). Bei Pumpen: Speicherinhalt im Zulaufkanal unter dem Wasserspiegel beim Einschalten der Pumpe (höchstes Einschaltniveau bei mehreren Pumpen)"
    Stauraum: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Aus Sicht des Erfassers massgebende Informationen zur Funktion des Ueberlaufs"
    Ueberlauf_Bemerkung: TEXT*80;
    !!@ comment = "Mittlere Überlaufdauer pro Jahr. Berechnung mit geplanten Massnahmen"
    Ueberlaufdauer_geplant: 0.0 .. 10000.0 [Units.h];
    !!@ comment = "Mittlere Überlaufdauer pro Jahr gemäss Langzeitsimulation oder Messung."
    Ueberlaufdauer_Ist: 0.0 .. 10000.0 [Units.h];
    !!@ comment = "Mittlere Überlaufdauer pro Jahr. Berechnung mit optimierten Einstellungen im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Ueberlaufdauer_Ist_optimiert: 0.0 .. 10000.0 [Units.h];
    !!@ comment = "Mittlere Überlaufhäufigkeit pro Jahr. Berechnung mit Einstellungen nach der Umsetzung der Massnahmen."
    Ueberlaufhaeufigkeit_geplant: Ueberlaufhaeufigkeit;
    !!@ comment = "Mittlere Überlaufhäufigkeit pro Jahr gemäss Langzeitsimulation oder Messung."
    Ueberlaufhaeufigkeit_Ist: Ueberlaufhaeufigkeit;
    !!@ comment = "Mittlere Überlaufhäufigkeit pro Jahr. Berechnung mit optimierten Einstellungen im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Ueberlaufhaeufigkeit_Ist_optimiert: Ueberlaufhaeufigkeit;
    !!@ comment = "Mittlere Überlaufwassermenge pro Jahr. Berechnung mit Einstellungen nach der Umsetzung der Massnahmen."
    Ueberlaufmenge_geplant: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Mittlere Überlaufmenge pro Jahr gemäss Langzeitsimulation oder Messung."
    Ueberlaufmenge_Ist: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Mittlere Überlaufwassermenge pro Jahr. Berechnung mit optimierten Einstellungen im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Ueberlaufmenge_Ist_optimiert: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Art des Wehrs im Regenüberlauf"
    Wehr_Art: (     
      andere,
      !!@ comment = "mit Bodenöffnung"
      Leapingwehr,
      !!@ comment = "Streichwehr mit hochgezogener Wehrschwelle"
      Streichwehr_hochgezogen,
      !!@ comment = "Streichwehr mit niedriger Wehrschwelle"
      Streichwehr_niedrig
    );
END SK_Regenueberlauf;

!!@ comment = "Assoziation"
ASSOCIATION SK_Regenueberlauf_EinleitstelleAssoc =
  EinleitstelleRef  -- {0..1} SK_Einleitstelle;
!!@comment = " Einleitststelle der Entlastungsleitung ins Gewässer"
  SK_Regenueberlauf_EinleitstelleAssocRef -- {0..*} SK_Regenueberlauf;
END SK_Regenueberlauf_EinleitstelleAssoc;

!!@ comment = "Stammkarte Regenüberlaufbecken (RÜB)"
CLASS SK_Regenueberlaufbecken EXTENDS SK =  
  ATTRIBUTE
    !!@ comment = "Anzahl Einwohner im direkten Einzugsgebiet als informativer Wert. Der massgebende Schmutzabwasseranfall ist im gleichnamigen entsprechenden Attribut anzugeben."
    Einwohner_Dim_geplant: EGW;
    !!@ comment = "Anzahl Einwohner im direkten Einzugsgebiet (Dimensionierung) als informativer Wert. Der massgebende Schmutzabwasseranfall ist im gleichnamigen entsprechenden Attribut anzugeben."
    Einwohner_Dim_Ist: EGW;
    !!@ comment = "Anzahl Einwohner im direkten Einzugsgebiet als informativer Wert. Der massgebende Schmutzabwasseranfall ist im gleichnamigen entsprechenden Attribut anzugeben."
    Einwohner_geplant: EGW;
    !!@ comment = "Anzahl Einwohner im direkten Einzugsgebiet als informativer Wert. Der massgebende Schmutzabwasseranfall ist im gleichnamigen entsprechenden Attribut anzugeben."
    Einwohner_Ist: EGW;
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsanteil_NH4_N_geplant: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsanteil_NH4_N_Ist: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsanteil_NH4_N_Ist_optimiert: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsfracht_NH4_N_geplant: Fracht;
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsfracht_NH4_N_Ist: Fracht;
    !!@ comment = "Gemäss Basismodul Kapitel 8.5 der Richtlinie ''Abwasserentsorgung bei Regenwetter'' des VSA (2019)"
    Entlastungsfracht_NH4_N_Ist_optimiert: Fracht;
    !!@ comment = "Umfasst die befestigte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene befestigte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_bef_Dim_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Umfasst die befestigte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene befestigte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_bef_Dim_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Befestigte Fläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene befestigte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_bef_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Befestigte Fläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene befestigte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_bef_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Das Dimensionierungseinzugsgebiet umfasst die Bruttofläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken"
    Flaeche_Dim_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Das Dimensionierungseinzugsgebiet umfasst die Bruttofläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken"
    Flaeche_Dim_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Bruttofläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken."
    Flaeche_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Bruttofläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken."
    Flaeche_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Umfasst die reduzierte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene reduzierte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_red_Dim_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Umfasst die reduzierte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene reduzierte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_red_Dim_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Reduzierte Fläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene reduzierte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_red_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Reduzierte Fläche des direkten Einzugsgebiets. Es umfasst alle Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlauf oder Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene reduzierte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_red_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Totaler Fremdwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Fremdwasseranfall_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Totaler Fremdwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Fremdwasseranfall_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Optimale Mehrbelastung nach der Umsetzung der Massnahmen."
    Mehrbelastung_geplant: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Mehrbelastung der untenliegenden Kanäle beim Dimensionierungsereignis = 100 * (Qab – Qan) / Qan 	[%]. Verhältnis zwischen der abgeleiteten Abwassermengen Richtung ARA beim Anspringen des Entlastungsbauwerkes (Qan) und Qab (Abwassermenge, welche beim Dimensionierungsereignis (z=5) weiter im Kanalnetz Richtung Abwasserreinigungsanlage abgeleitet wird). Beispiel: Qan = 100 l/s, Qab = 150 l/s -> Mehrbelastung = 50%"
    Mehrbelastung_Ist: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Optimale Mehrbelastung im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Mehrbelastung_Ist_optimiert: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Inhalt der Kammer unterhalb der Wehrkrone ohne Stauraum im Zulaufkanal. Letzterer wird unter dem Attribut Stauraum erfasst (bei Anordnung im Hauptschluss auf der Stammkarte des Hauptbauwerkes, bei Anordnung im Nebenschluss auf der Stammkarte des vorgelagerten Trennbauwerkes oder Regenüberlaufs)"
    Nutzinhalt_Fangteil: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Inhalt der Kammer unterhalb der Wehrkrone inkl. Einlaufbereich, Auslaufbereich und Sedimentationsbereich, ohne Stauraum im Zulaufkanal. Letzterer wird unter dem Attribut Stauraum erfasst (bei Anordnung im Hauptschluss auf der Stammkarte des Hauptbauwerkes, bei Anordnung im Nebenschluss auf der Stammkarte des vorgelagerten Trennbauwerkes oder Regenüberlaufs)"
    Nutzinhalt_Klaerteil: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Optimale Menge nach der Umsetzung der Massnahmen."
    Qan_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Qan im heutigen Zustand, Ist-Wert aufgrund von Blechöffnungen, Drosselstrecken, etc. Qan ist die Abwassermenge, welche beim Anspringen des Überlaufs weiter im Kanalnetz Richtung Abwasserreinigungsanlage abgeleitet wird. Wassermenge bei welcher der Überlauf tatsächlich anspringt (Ist-Zustand)"
    Qan_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Optimale Menge im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Qan_Ist_optimiert: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Anordnung des Regenbeckens im System, vgl. Kap. 6.2. Modul DB der VSA-Richtlinie Abwasserbewirtschaftung bei Regenwetter."
    Regenbecken_Anordnung: (     
      !!@ comment = "Durchfluss des Beckens bei Trockenwetter und teilweiser Durchfluss bei Regenwetter"
      Hauptschluss,
      !!@ comment = "Durchfluss des Beckens nur bei Regenwetter"
      Nebenschluss,
      unbekannt
    );
    !!@ comment = "Totaler Schmutzabwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Schmutzabwasseranfall_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Totaler Schmutzabwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Schmutzabwasseranfall_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Speicherinhalt im Becken und im Zulauf zwischen Wehrkrone und dem Wasserspiegel bei Qan. Bei Regenbeckenüberlaufbecken im Nebenschluss ist der Stauraum beim vorgelagerten Trennbauwerk bzw. Regenüberlauf zu erfassen (vgl. Erläuterungen Inhalt_Fangteil reps. _Klaerteil). Bei Pumpen: Speicherinhalt im Zulaufkanal unter dem Wasserspiegel beim Einschalten der Pumpe (höchstes Einschaltniveau bei mehreren Pumpen)"
    Stauraum: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Aus Sicht des Erfassers massgebende Informationen zur Funktion des Ueberlaufs"
    Ueberlauf_Bemerkung: TEXT*80;
    !!@ comment = "Mittlere Überlaufdauer pro Jahr. Berechnung mit geplanten Massnahmen"
    Ueberlaufdauer_geplant: 0.0 .. 10000.0 [Units.h];
    !!@ comment = "Mittlere Überlaufdauer pro Jahr gemäss Langzeitsimulation oder Messung."
    Ueberlaufdauer_Ist: 0.0 .. 10000.0 [Units.h];
    !!@ comment = "Mittlere Überlaufdauer pro Jahr. Berechnung mit optimierten Einstellungen im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Ueberlaufdauer_Ist_optimiert: 0.0 .. 10000.0 [Units.h];
    !!@ comment = "Mittlere Überlaufhäufigkeit pro Jahr. Berechnung mit Einstellungen nach der Umsetzung der Massnahmen."
    Ueberlaufhaeufigkeit_geplant: Ueberlaufhaeufigkeit;
    !!@ comment = "Mittlere Überlaufhäufigkeit pro Jahr gemäss Langzeitsimulation oder Messung."
    Ueberlaufhaeufigkeit_Ist: Ueberlaufhaeufigkeit;
    !!@ comment = "Mittlere Überlaufhäufigkeit pro Jahr. Berechnung mit optimierten Einstellungen im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Ueberlaufhaeufigkeit_Ist_optimiert: Ueberlaufhaeufigkeit;
    !!@ comment = "Mittlere Überlaufwassermenge pro Jahr. Berechnung mit Einstellungen nach der Umsetzung der Massnahmen."
    Ueberlaufmenge_geplant: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Mittlere Überlaufmenge pro Jahr gemäss Langzeitsimulation oder Messung."
    Ueberlaufmenge_Ist: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Mittlere Überlaufwassermenge pro Jahr. Berechnung mit optimierten Einstellungen im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Ueberlaufmenge_Ist_optimiert: 0.00 .. 10000000.00 [Units.m3];
END SK_Regenueberlaufbecken;

!!@ comment = "Assoziation"
ASSOCIATION SK_Regenueberlaufbecken_EinleitstelleAssoc =
  EinleitstelleRef  -- {0..1} SK_Einleitstelle;
!!@comment = " Einleitststelle der Entlastungsleitung ins Gewässer"
  SK_Regenueberlaufbecken_EinleitstelleAssocRef -- {0..*} SK_Regenueberlaufbecken;
END SK_Regenueberlaufbecken_EinleitstelleAssoc;

!!@ comment = "Stammkarte Regenrückhaltebecken / -kanal"
CLASS SK_Regenrueckhaltebecken_kanal EXTENDS SK =  
  ATTRIBUTE
    !!@ comment = "Anzahl Einwohner im direkten Einzugsgebiet als informativer Wert. Der massgebende Schmutzabwasseranfall ist im gleichnamigen entsprechenden Attribut anzugeben."
    Einwohner_Dim_geplant: EGW;
    !!@ comment = "Anzahl Einwohner im direkten Einzugsgebiet (Dimensionierung) als informativer Wert. Der massgebende Schmutzabwasseranfall ist im gleichnamigen entsprechenden Attribut anzugeben."
    Einwohner_Dim_Ist: EGW;
    !!@ comment = "Umfasst die befestigte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene befestigte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_bef_Dim_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Umfasst die befestigte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene befestigte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_bef_Dim_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Das Dimensionierungseinzugsgebiet umfasst die Bruttofläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken"
    Flaeche_Dim_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Das Dimensionierungseinzugsgebiet umfasst die Bruttofläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken"
    Flaeche_Dim_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Umfasst die reduzierte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene reduzierte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_red_Dim_geplant: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Umfasst die reduzierte Fläche aller Teileinzugsgebiete oberhalb des Bauwerks, bis zum nächstoberen Regenüberlaufbecken. Im Trennsystem ist nur die effektiv an das Bauwerk angeschlossene reduzierte Fläche anzugeben (i.d.R. die über die Schmutzabwasserknoten verbundene). Es muss mindestens eine Fläche (befestigt oder reduziert) angegeben werden."
    Flaeche_red_Dim_Ist: 0.0000 .. 100000.0000 [Units.ha];
    !!@ comment = "Totaler Fremdwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Fremdwasseranfall_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Totaler Fremdwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Fremdwasseranfall_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Das Attribut beschreibt, wohin die das Volumen übersteigende Menge abgeleitet wird (v.a bei Regenrückhaltebecken / Regenrückhaltekanal)."
    Notueberlauf: (     
      andere,
      !!@ comment = "Direkte Rohrverbindung zu einem Gewässer (unerwünschte Konstruktion).  Notentlastung_EinleitstelleRef auch abfüllen, damit Handlungsbedarf sichtbar wird."
      in_Gewaesser,
      !!@ comment = "''in_Mischwasserkanalisation'' heisst, dass das Bauwerk direkt verrohrt ist und nicht frei über das Gelände zwischendurch läuft"
      in_Mischabwasserkanalisation,
      !!@ comment = "''in_Regenabwasserkanalisation'' heisst, dass das Bauwerk direkt verrohrt ist und nicht frei über das Gelände zwischendurch läuft"
      in_Regenabwasserkanalisation,
      !!@ comment = "''in_Schmutzabwasserkanalisation'' heisst, dass das Bauwerk direkt verrohrt ist und nicht frei über das Gelände  zwischendurch läuft"
      in_Schmutzabwasserkanalisation,
      keiner,
      !!@ comment = "Das Wasser überfliesst beim Einstau über das Bauwerk hinaus an die Oberfläche (Hinweis auf verstopfte Anlage)."
      oberflaechlich_ausmuendend,
      unbekannt
    );
    !!@ comment = "Inhalt der Kammer unterhalb Notüberlauf oder Bypass (maximal mobilisierbares Volumen, exkl. Stauraum im Zulaufkanal). Bei Regenrückhaltekanälen und Stauraumkanälen im Hauptschluss ist der Nutzinhalt = 0. Es ist nur Stauraum vorhanden, der im entsprechenden Attribut zu erfassen ist."
    Nutzinhalt: 0.00 .. 10000000.00 [Units.m3];
    !!@ comment = "Qab im geplanten Zustand gemäss GEP.  (Ausfüllen bei Regenrückhaltebecken / Regenrückhaltekanal)"
    Qab_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Qab im heutigen Zustand, Ist-Wert aufgrund von Blechöffnungen, Drosselstrecken, etc. Qab ist die Abwassermenge, welche beim Dimensionierungsereignis (z=5) weiter im Kanalnetz Richtung Abwasserreinigungsanlage abgeleitet wird. (Ausfüllen bei Regenrückhaltebecken / Regenrückhaltekanal)"
    Qab_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Berechneter Wert Qab, welcher aufgrund der Randbedingungen im heutigen Zustand einen gemäss Gesetzen und Richtlinien geforderten Zustand gewährleistet.  (Ausfüllen bei Regenrückhaltebecken / Regenrückhaltekanal)"
    Qab_Ist_optimiert: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Anordnung des Regenbeckens im System, vgl. Kap. 6.2. Modul DB der VSA-Richtlinie Abwasserbewirtschaftung bei Regenwetter."
    Regenbecken_Anordnung: (     
      !!@ comment = "Durchfluss des Beckens bei Trockenwetter und teilweiser Durchfluss bei Regenwetter"
      Hauptschluss,
      !!@ comment = "Durchfluss des Beckens nur bei Regenwetter"
      Nebenschluss,
      unbekannt
    );
    !!@ comment = "Totaler Schmutzabwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Schmutzabwasseranfall_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Totaler Schmutzabwasseranfall beim Bauwerk inkl. aller obenliegenden Gebiete. Angabe Jahresmittelwert (24 Std.-Mittel) in l/s."
    Schmutzabwasseranfall_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Speicherinhalt im Becken und im Zulauf zwischen Wehrkrone und dem Wasserspiegel bei Qan. Bei Regenbeckenüberlaufbecken im Nebenschluss ist der Stauraum beim vorgelagerten Trennbauwerk bzw. Regenüberlauf zu erfassen (vgl. Erläuterungen Inhalt_Fangteil reps. _Klaerteil). Bei Pumpen: Speicherinhalt im Zulaufkanal unter dem Wasserspiegel beim Einschalten der Pumpe (höchstes Einschaltniveau bei mehreren Pumpen)"
    Stauraum: 0.00 .. 10000000.00 [Units.m3];
END SK_Regenrueckhaltebecken_kanal;

!!@ comment = "Stammkarte Trennbauwerk: Bauwerk, welches Abwasser im System auftrennt, aber nicht aus dem System entlastet. Ein oder mehrere Zuläufe, zwei oder mehr Abläufe."
CLASS SK_Trennbauwerk EXTENDS SK =  
  ATTRIBUTE
    !!@ comment = "Die Art des Trennbauwerkes ist anzugeben."
    Art: (     
      andere,
      !!@ comment = "Freie Aufteilung bedeutet Aufteilung des Abflusses infolge der hydraulischen Randbedingungen. Dann ist kein Ueberlauf zu erfassen (in VSA-DSS)"
      freie_Aufteilung,
      !!@ comment = "Leapingwehr (Bodenöffnung)"
      Leapingwehr,
      !!@ comment = "Bisher keine direkte Entsprechung in der VSA-DSS. Sekundärrichtung_geschlossen, wenn abgehender Kanal.Status ausser_Betrieb (und entsprechende Subwerte)"
      Sekundaerrichtung_geschlossen,
      !!@ comment = "Streichwehr oder anderer Überfall"
      Streichwehr,
      unbekannt
    );
    !!@ comment = "Optimale Mehrbelastung nach der Umsetzung der Massnahmen."
    Mehrbelastung_geplant: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Mehrbelastung der untenliegenden Kanäle beim Dimensionierungsereignis = 100 * (Qab – Qan) / Qan 	[%]. Verhältnis zwischen der abgeleiteten Abwassermengen Richtung ARA beim Anspringen des Entlastungsbauwerkes (Qan) und Qab (Abwassermenge, welche beim Dimensionierungsereignis (z=5) weiter im Kanalnetz Richtung Abwasserreinigungsanlage abgeleitet wird). Beispiel: Qan = 100 l/s, Qab = 150 l/s -> Mehrbelastung = 50%"
    Mehrbelastung_Ist: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Optimale Mehrbelastung im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Mehrbelastung_Ist_optimiert: 0.00 .. 100.00 [Units.Percent];
    !!@ comment = "Optimale Menge nach der Umsetzung der Massnahmen."
    Qan_geplant: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Qan im heutigen Zustand, Ist-Wert aufgrund von Blechöffnungen, Drosselstrecken, etc. Qan ist die Abwassermenge, welche beim Anspringen des Überlaufs weiter im Kanalnetz Richtung Abwasserreinigungsanlage abgeleitet wird. Wassermenge bei welcher der Überlauf tatsächlich anspringt (Ist-Zustand)"
    Qan_Ist: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Optimale Menge im Ist-Zustand vor der Umsetzung von allfälligen weiteren Massnahmen."
    Qan_Ist_optimiert: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Speicherinhalt im Becken und im Zulauf zwischen Wehrkrone und dem Wasserspiegel bei Qan. Bei Regenbeckenüberlaufbecken im Nebenschluss ist der Stauraum beim vorgelagerten Trennbauwerk bzw. Regenüberlauf zu erfassen (vgl. Erläuterungen Inhalt_Fangteil reps. _Klaerteil). Bei Pumpen: Speicherinhalt im Zulaufkanal unter dem Wasserspiegel beim Einschalten der Pumpe (höchstes Einschaltniveau bei mehreren Pumpen)"
    Stauraum: 0.00 .. 10000000.00 [Units.m3];
END SK_Trennbauwerk;

!!@ comment = "Assoziation"
ASSOCIATION SK_Trennbauwerk_PrimaerrichtungAssoc =
  PrimaerrichtungRef  -- {1} Knoten;
!!@comment = " Nächster Knoten in Primärrichtung"
  SK_Trennbauwerk_PrimaerrichtungAssocRef -- {0..*} SK_Trennbauwerk;
END SK_Trennbauwerk_PrimaerrichtungAssoc;

!!@ comment = "Stammkarte Uebrige: Bauwerke, die eine spezielle Funktion im Entwässerungsnetz wahrnehmen und entsprechend dokumentiert werden sollen, sich aber keiner anderen Stammkarten Kategorien zuordnen lassen."
CLASS SK_Uebrige EXTENDS SK =  
  ATTRIBUTE
    !!@ comment = "Beschrieb des Sonderbauwerkes"
    Beschrieb: MTEXT*255;
END SK_Uebrige;

!!@ comment = "Die Kennlinie des Bauwerks beschreibt den Verlauf der Wassermenge Richtung ARA aus dem Entlastungsbauwerkes bei verschiedenen Zufluss-Verhältnissen. Sie muss aus mindestens 2 Stützpunkten bestehen. Kann zusätzlich als Tabelle oder Ausdruck aus dem Berechnungsmodell abgegeben werden. Die Kennlinie ist als Q/Q oder H/Q- Tabelle zu dokumentieren. Q(1) / Q(2) -Grafik: Q1 =Q Zuflaufss [l/s], Q2 = Abfluss Richtung ARA [l/s]. H/Q- Grafik: H = Wasserspiegel beim Überlauf [m.ü.M.], Q = Abfluss Richtung ARA [l/s]. Bei Abflussverhältnissen in Einstaubereichen ist die Funktion separat in einer Beilage zu beschreiben."
CLASS Kennlinie_Stuetzpunkt EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Abflussmenge (Q2) Richtung ARA"
    Abfluss: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Zum Abfluss (Q2) korrelierender Wasserspiegel (h)"
    Hoehe: Base_LV95.Hoehe;
    !!@ comment = "OID der zugehörigen HQ_Relation in der VSA-DSS, nur für Modelltransfers"
    OBJ_ID_HQ_Relation: TEXT*16;
    Status: (     
      geplant,
      Ist,
      Ist_optimiert
    );
    !!@ comment = "Zufluss (Q1)"
    Zufluss: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
END Kennlinie_Stuetzpunkt;

!!@ comment = "Assoziation"
ASSOCIATION Kennlinie_Stuetzpunkt_SK_RegenueberlaufAssoc =
  SK_RegenueberlaufRef  -- {0..1} SK_Regenueberlauf;
  Kennlinie_Stuetzpunkt_SK_RegenueberlaufAssocRef -- {0..*} Kennlinie_Stuetzpunkt;
END Kennlinie_Stuetzpunkt_SK_RegenueberlaufAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Kennlinie_Stuetzpunkt_SK_TrennbauwerkAssoc =
  SK_TrennbauwerkRef  -- {0..1} SK_Trennbauwerk;
  Kennlinie_Stuetzpunkt_SK_TrennbauwerkAssocRef -- {0..*} Kennlinie_Stuetzpunkt;
END Kennlinie_Stuetzpunkt_SK_TrennbauwerkAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Kennlinie_Stuetzpunkt_SK_RegenueberlaufbeckenAssoc =
  SK_RegenueberlaufbeckenRef  -- {0..1} SK_Regenueberlaufbecken;
  Kennlinie_Stuetzpunkt_SK_RegenueberlaufbeckenAssocRef -- {0..*} Kennlinie_Stuetzpunkt;
END Kennlinie_Stuetzpunkt_SK_RegenueberlaufbeckenAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Kennlinie_Stuetzpunkt_SK_Regenrueckhaltebecken_kanalAssoc =
  SK_Regenrueckhaltebecken_kanalRef  -- {0..1} SK_Regenrueckhaltebecken_kanal;
  Kennlinie_Stuetzpunkt_SK_Regenrueckhaltebecken_kanalAssocRef -- {0..*} Kennlinie_Stuetzpunkt;
END Kennlinie_Stuetzpunkt_SK_Regenrueckhaltebecken_kanalAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Kennlinie_Stuetzpunkt_SK_DuekeroberhauptAssoc =
  SK_DuekeroberhauptRef  -- {0..1} SK_Duekeroberhaupt;
  Kennlinie_Stuetzpunkt_SK_DuekeroberhauptAssocRef -- {0..*} Kennlinie_Stuetzpunkt;
END Kennlinie_Stuetzpunkt_SK_DuekeroberhauptAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Kennlinie_Stuetzpunkt_SK_PumpwerkAssoc =
  SK_PumpwerkRef  -- {0..1} SK_Pumpwerk;
  Kennlinie_Stuetzpunkt_SK_PumpwerkAssocRef -- {0..*} Kennlinie_Stuetzpunkt;
END Kennlinie_Stuetzpunkt_SK_PumpwerkAssoc;

!!@ comment = "Bauwerkskomponente der Stammkarte, Ausrüstungen resp. Hilfsbetriebe"
CLASS Bauwerkskomponente EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Art der Bauwerkskomponente (zwingend). Pro Datensatz eine Bauwerkskomponente. Deren Angaben müssen jeweils vollständig sein, auch wenn in INTERLIS optional gesetzt."
    Art: (     
      Beckenentleerung,
      Beckenreinigung,
      Drosselorgan,
      Feststoffrueckhalt,
      !!@ comment = "Fördern Aggregate zu unterschiedlichen Punkten im Netz, sind getrennte SK zu erfassen"
      Foerderaggregat,
      !!@ comment = "Die Komponente Messgerät wird verwendet, wenn eine Messung beispielsweise zur Steuerung / Regelung der Abwassermenge Richtung Kläranlage des Bauwerks dient."
      Messgeraet,
      !!@ comment = "Nur für Notüberläufe innerhalb von Pumpwerken erfassen. Notüberläufe in separaten Bauwerken werden mit der Stammkarte RU erfasst (Attribut springt_an = nein setzen)."
      Notentlastung,
      Rueckstausicherung,
      Ueberlauf
    );
    !!@ comment = "Die Bauwerkskomponente Beckenentleerung darf nur einmal ausgefüllt werden. Wird ein Regenbecken beispielsweise mit mehreren Pumpen entleert, wird in der Bauwerkskomponente die Gesamtleistung aller Pumpen erfasst."
    Beckenentleerung_Art: (     
      andere,
      !!@ comment = "Der Wert „Gravitation“ wird verwendet, wenn das Bauwerk ohne Hilfsbetrieb entleert wird."
      Gravitation,
      !!@ comment = "Bei mehreren Pumpen muss die maximale Gesamtmenge erfasst werden."
      Pumpe,
      !!@ comment = "Bei mehreren Schiebern muss die maximale Gesamtmenge erfasst werden."
      Schieber,
      unbekannt
    );
    !!@ comment = "Bei mehreren Pumpen / Schiebern muss die maximale Gesamtmenge erfasst werden."
    Beckenentleerung_Leistung: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    Beckenreinigung_Art: (     
      !!@ comment = "Druckluftstrom, auch Injektorpumpe genannt"
      Air_Jet,
      andere,
      !!@ comment = "Der Wert „keine“ wird verwendet, wenn das Bauwerk ohne Hilfsbetrieb gereinigt wird."
      keine,
      Raeumereinrichtung,
      Ruehrwerk,
      Schlaengelrinne,
      Schwallspuelung,
      Spuelkippe,
      unbekannt
    );
    !!@ comment = "Allgemeine Bemerkungen"
    Bemerkung: TEXT*80;
    Drosselorgan_Art: (     
      Abflussregulator,
      andere,
      !!@ comment = "Bei einer Drosselstrecke ist sowohl ein (Absperr_)Drosselorgan als auch eine Leitung.FunktionHydraulisch=Drosselleitung zu erfassen (Erfassungsregel)."
      Drosselstrecke,
      Leapingwehr,
      !!@ comment = "Stammkarte Pumpwerk zusätzlich ausfüllen"
      Pumpe,
      Schieber_fix,
      Schieber_geregelt,
      Schieber_gesteuert,
      unbekannt
    );
    !!@ comment = "Folgende Werte sind anzugeben: Leapingwehr: Schrägdistanz der Blech- resp. Bodenöffnung. Drosselstrecke: keine Angabe. Schieber / Schütz: lichte Höhe der Öffnung (ab Sohle bis UK Schieberplatte, tiefster Punkt). Abflussregulator: keine Angabe. Pumpe: keine Angabe"
    Drosselorgan_Oeffnung_Ist: Lichte_Hoehe;
    !!@ comment = "Folgende Werte sind anzugeben: Leapingwehr: Schrägdistanz der Blech- resp. Bodenöffnung. Drosselstrecke: keine Angabe. Schieber / Schütz: lichte Höhe der Öffnung (ab Sohle bis UK Schieberplatte, tiefster Punkt). Abflussregulator: keine Angabe. Pumpe: keine Angabe"
    Drosselorgan_Oeffnung_Ist_optimiert: Lichte_Hoehe;
    !!@ comment = "Anspringkote Feststoffrückhalt in m.ü.M."
    Feststoffrueckhalt_Anspringkote: Base_LV95.Hoehe;
    !!@ comment = "Art des Feststoffrückhaltes"
    Feststoffrueckhalt_Art: (     
      andere,
      !!@ comment = "Bürstenrechen"
      Buerstenrechen,
      !!@ comment = "auch Siebrechen genannt"
      Feinrechen,
      !!@ comment = "Stababstand > 10mm"
      Grobrechen,
      !!@ comment = "Lochblech"
      Sieb,
      Stauschild,
      Tauchwand,
      unbekannt
    );
    !!@ comment = "Wassermenge, Dimensionierungswert"
    Feststoffrueckhalt_Dimensionierungswert: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Pumpenarten"
    Foerderaggregat_Bauart: (     
      andere,
      Druckluftanlage,
      Kolbenpumpe,
      Kreiselpumpe,
      Schneckenpumpe,
      unbekannt,
      Vakuumanlage
    );
    !!@ comment = "Maximaler Förderstrom der Pumpe (einzeln). Tritt in der Regel bei der minimalen Förderhöhe ein."
    Foerderaggregat_FoerderstromMax_einzeln: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Minimaler Förderstrom der Pumpe (einzeln). Tritt in der Regel bei der maximalen Förderhöhe ein."
    Foerderaggregat_FoerderstromMin_einzeln: 0.000 .. 100000.000 [SIA405_Base_Abwasser_LV95.ls];
    !!@ comment = "Typ des Messgeräts"
    Messgeraet_Art: (     
      andere,
      Drucksonde,
      Lufteinperlung,
      !!@ comment = "Magnetisch-induktives Durchflussmesssgerät für teilgefüllte Rohre"
      MID_teilgefuellt,
      !!@ comment = "Magnetisch-induktives Durchflussmesssgerät für vollgefüllte Rohre"
      MID_vollgefuellt,
      Radar,
      Schwimmer,
      Ultraschall,
      unbekannt
    );
    !!@ comment = "Art der Messung des zugehörigen Messresultat.Messart, z.B zeit- oder mengenproportional"
    Messgeraet_Messart: (     
      andere,
      Durchfluss,
      Niveau,
      unbekannt
    );
    !!@ comment = "Staukoerper der zugehörigen Messstelle"
    Messgeraet_Staukoerper: (     
      andere,
      keiner,
      !!@ comment = "Alle Formen wie Dreieckwehr etc."
      Ueberfallwehr,
      unbekannt,
      Venturieinschnuerung
    );
    !!@ comment = "Zweck der Messung"
    Messgeraet_Zweck: (     
      !!@ comment = "Kostenverteilung und technischer Zweck"
      beides,
      Kostenverteilung,
      !!@ comment = "In der Regel ist bei Bauwerkskomponenten nur ein technischer Zweck (Regelung) gegeben."
      technischer_Zweck,
      unbekannt
    );
    !!@ comment = "Sohlenkote Auslauf Notentlastung. Sollte ein Wehr angeordnet sein, ist die Wehrhöhe zu erfassen"
    Notentlastung_Kote: Base_LV95.Hoehe;
    !!@ comment = "OID des Absperr_Drosselorgans in der VSA-DSS, nur für Modelltransfers, falls Drosselorgan_Art = Abflussregulator oder Schieber* oder Beckenentleerung_Art = Schieber oder Rueckstausicherung_Art = Stauschild"
    OBJ_ID_Absperr_Drosselorgan: TEXT*16;
    !!@ comment = "OID der zum Messgeraet zugehörigen Messstelle in der VSA-DSS, nur für Modelltransfers"
    OBJ_ID_Messstelle: TEXT*16;
    !!@ comment = "OID des Ueberlaufs in der VSA-DSS, nur für Modelltransfers, falls Drosselorgan_Art  = Leapingwehr oder Pumpe, Beckenentleerung.Art = Pumpe bzw. Rueckstausicherung.Art = Pumpe. Auch ausfüllen für Ueberlauf.Funktion = Notentlastung (zugehöriger Ueberlauf)"
    OBJ_ID_Ueberlauf: TEXT*16;
    !!@ comment = "Die Rückstausicherung verhindert den Rückfluss von Wasser aus dem Gewässer in das Abwasser-netz. Das Attribut wird bei demjenigen Sonderbauwerk erfasst, in dem es eingebaut ist. Ist keine Rückstausicherung vorhanden, muss diese Bauwerks¬komponente leer gelassen werden."
    Rueckstausicherung_Art: (     
      andere,
      Pumpe,
      Rueckstauklappe,
      Stauschild,
      unbekannt
    );
    !!@ comment = "Hydraulisch wirksame Wehrlänge (nur bei Streichwehren anzugeben). Bei zweiseitigem Überfall sind zwei Überläufe zu erfassen."
    Ueberlauf_HydrUeberfalllaenge: 0.00 .. 30000.00 [m];
    !!@ comment = "Kote des höchsten Punktes der Überfallkante (nur bei Streichwehren zu erfassen). Bei horizontalen Überfallkanten sind die Werte von KoteMin und Kote Max identisch"
    Ueberlauf_KoteMax: Base_LV95.Hoehe;
    !!@ comment = "Kote des tiefsten Punktes der Überfallkante (nur bei Streichwehren zu erfassen)."
    Ueberlauf_KoteMin: Base_LV95.Hoehe;
END Bauwerkskomponente;

!!@ comment = "Assoziation"
ASSOCIATION Bauwerkskomponente_StammkarteAssoc =
  StammkarteRef  -- {1} SK;
  Bauwerkskomponente_StammkarteAssocRef -- {0..*} Bauwerkskomponente;
END Bauwerkskomponente_StammkarteAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Bauwerkskomponente_UeberlaufNachAssoc =
  UeberlaufNachRef  -- {0..1} Knoten;
  Bauwerkskomponente_UeberlaufNachAssocRef -- {0..*} Bauwerkskomponente;
END Bauwerkskomponente_UeberlaufNachAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Bauwerkskomponente_Notenlastung_EinleitstelleAssoc =
  Notenlastung_EinleitstelleRef  -- {0..1} Knoten;
!!@comment = " Verknüpfung mit Knoten der Einleitstelle der Notentlastung"
  Bauwerkskomponente_Notenlastung_EinleitstelleAssocRef -- {0..*} Bauwerkskomponente;
END Bauwerkskomponente_Notenlastung_EinleitstelleAssoc;

!!@ comment = "Massnahmen die im Rahmen des GEP erarbeitet wurden und Stand ihrer Umsetzung. Für wiederkehrende Aufgaben sollen keine ‘Massnahmen’, sondern die Klasse Erhaltungsereignis verwendet werden. Die Kosten der wiederkehrenden Aufgaben sind im Teilprojekt Finanzierung zu berücksichtigen."
CLASS Massnahme EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Bemerkungen des Projektverfassers oder der Aufsichtsbehörde"
    Bemerkung: TEXT*80;
    Beschreibung: TEXT*100;
    Bezeichnung: MANDATORY TEXT*50;
    !!@ comment = "Datum, an welchem die Massnahme in die Massnahmenliste aufgenommen wurde"
    Datum_Eingang: INTERLIS_1_DATE;
    !!@ comment = "Summe der Eigenleistung und Kosten Dritter. Allenfalls können diese zusätzlich auch separat ausgewiesen werden"
    Gesamtkosten: 0.00 .. 99999999.99 [Units.CHF];
    !!@ comment = "Kurzbeschreibung des Handlungsbedarfs"
    Handlungsbedarf: MTEXT*255;
    !!@ comment = "Jahr, in dem die Massnahme effektiv umgesetzt wurde"
    Jahr_Umsetzung_effektiv: SIA405_Base_Abwasser_LV95.Jahr;
    !!@ comment = "Jahr bis die Massnahme umgesetzt sein soll"
    Jahr_Umsetzung_geplant: SIA405_Base_Abwasser_LV95.Jahr;
    !!@ comment = "Massnahmenkategorie (obligatorisch)"
    Kategorie: (     
      !!@ comment = "Massnahmen in der Liegenschaftsentwässerung zur Förderung des kleinräumigen Wasserkreislaufes"
      Abflussvermeidung_Retention_Versickerung,
      !!@ comment = "Anpassung von Reglementen, Erarbeiten von vertraglichen Regelungen, etc."
      administrative_Massnahme,
      andere,
      !!@ comment = "Ausserbetriebnahme oder Rückbau von bestehenden Anlagen"
      Aufhebung,
      Datenmanagement,
      !!@ comment = "Herstellung neuer Abwasserkanäle in der bisherigen oder anderer Linienführung, wobei die neuen Anlagen die Funktion der ursprünglichen Abwasserkanäle einbeziehen (SN EN 752)."
      Erhaltung_Erneuerung,
      !!@ comment = "Reinigung oder Entleerung"
      Erhaltung_Reinigung,
      !!@ comment = "Renovierung: Massnahmen zur Verbesserung der aktuellen Funktionsfähigkeit von Abwasserkanälen unter vollständigem oder teilweisem Einbezug ihrerursprünglichen Substanz. Reparatur:  Massnahmen zur Behebung örtlich begrenzter Schäden (SN EN 752)."
      Erhaltung_Renovierung_Reparatur,
      !!@ comment = "Falls die Erhaltungsmassnahme noch nicht spezifiziert ist"
      Erhaltung_unbekannt,
      Fremdwasserreduktion,
      !!@ comment = "Z.B. Änderung der Nutzungsart eines Kanalabschnitts. Für Sonderbauwerke den Wert Sonderbauwerk_Anpassung verwenden."
      Funktionsaenderung,
      !!@ comment = "Alle Arbeiten im Zusammenhang mit der Überarbeitung oder Nachführung des GEP"
      GEP_Bearbeitung,
      Kontrolle_und_Ueberwachung,
      !!@ comment = "Neuer Vorschlag Wegleitung Daten der Siedlungsentwässerung 2020: Ersetzt Bachsanierung und Bachrenaturierung als generellerer Begriff."
      Massnahme_im_Gewaesser,
      !!@ comment = "Neuerstellung von Anlagen. Für Sonderbauwerke und Ersatzneubauten die spezifischen Werte Sonderbauwerk_Neubau bzw. Erhaltung_Erneuerung verwenden."
      Netzerweiterung,
      !!@ comment = "Hydraulisch-konzeptionelle Anpassungen wie Neueinstellung der Weiterleitmenge oder hydraulische Optimierung. Nicht verwenden für reine Erhaltungsmassnahmen."
      Sonderbauwerk_Anpassung,
      Sonderbauwerk_Neubau,
      !!@ comment = "Neuer Vorschlag Wegleitung Daten der Siedlungsentwässerung 2020"
      Stoerfallvorsorge,
      unbekannt
    );
    !!@ comment = "Ermöglicht die Visualisierung einer Massnahme mit einer Linie (optional)"
    Linie: Base_LV95.Polyline;
    !!@ comment = "Ermöglicht die Visualisierung einer Massnahme mit einer Fläche (optional)"
    Perimeter: Base_LV95.Surface;
    !!@ comment = "Priorität der Massnahme"
    Prioritaet: (     
      !!@ comment = "Die Massnahme ist sehr dringend und kurzfristig auszuführen. Zeithorizont <= 2 Jahre"
      M0,
      !!@ comment = "Die Massnahme ist dringend auszuführen. Zeithorizont 3-4 Jahre"
      M1,
      !!@ comment = "Die Massnahme ist mittelfristig erforderlich. Zeithorizont 5-7 Jahre"
      M2,
      !!@ comment = "Die Massnahme kann längerfristig geplant werden. Zeithorizont 7-10 Jahre"
      M3,
      !!@ comment = "Die Massnahme kann bis zur nächsten GEP-Überarbeitung warten. Zeithorizont >= 10 Jahre"
      M4,
      unbekannt
    );
    !!@ comment = "Status der Massnahme"
    Status: (     
      erledigt,
      in_Bearbeitung,
      pendent,
      sistiert,
      unbekannt
    );
    !!@ comment = "Für die Visualisierung (ohne räumlichen Bezug)"
    SymbolPos: Base_LV95.LKoord;
    !!@ comment = "Verweis auf andere Massnahmen (Bezeichnung) oder Arbeiten, Hinweis auf Grundlagen in denen die Massnahmen näher erläutert werden, wie z.B. auf die entsprechenden GEP-Teilprojekte"
    Verweis: MTEXT*255;
UNIQUE 
    !!@ comment = "UNIQUE Kombination Bezeichnung, DatenherrRef, damit mit VSA-DSS-Mini kompatibel (Wegleitung GEP-Daten 2014)"
    Bezeichnung, DatenherrRef;
END Massnahme;

!!@ comment = "Assoziation"
ASSOCIATION Massnahme_TraegerschaftAssoc =
  TraegerschaftRef (EXTERNAL) -- {1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
  Massnahme_TraegerschaftAssocRef -- {0..*} Massnahme;
END Massnahme_TraegerschaftAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Massnahme_Verantwortlich_AusloesungAssoc =
  Verantwortlich_AusloesungRef (EXTERNAL) -- {1} SIA405_Base_Abwasser_LV95.Administration.Organisation;
  Massnahme_Verantwortlich_AusloesungAssocRef -- {0..*} Massnahme;
END Massnahme_Verantwortlich_AusloesungAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Massnahme_LeitungAssoc =
  LeitungRef  -- {0..*} Leitung;
  Massnahme_LeitungAssocRef -- {0..*} Massnahme;
END Massnahme_LeitungAssoc;

!!@ comment = "Assoziation"
ASSOCIATION Massnahme_KnotenAssoc =
  KnotenRef  -- {0..*} Knoten;
  Massnahme_KnotenAssocRef -- {0..*} Massnahme;
END Massnahme_KnotenAssoc;

!!@ comment = "Abwasserentsorgung im ländlichen Raum (ALR)"
CLASS ALR EXTENDS VSA_BaseClass =  
  ATTRIBUTE
    !!@ comment = "Aktuelle Beseitigung des Abwassers"
    Beseitigung_Ist: (     
      !!@ comment = "Abflusslose Toilette"
      Abflusslose_Toilette,
      !!@ comment = "Abflusslose Grube"
      AbflussloseGrube,
      !!@ comment = "Abwasserfaulraum: 3 Kammern"
      Abwasserfaulraum,
      !!@ comment = "Falls Wert ''andere'' verwendet wird, muss die Beseitigung in Bemerkung präzisiert werden, z.B. Einleitung oder Versickerung ohne Behandlung bei Berghütte"
      andere,
      Anschluss_Kanalisation,
      !!@ comment = "Faulgrube: 2 Kammern"
      Faulgrube,
      !!@ comment = "Gülle- bzw. Jauchegrube. Landwirtschaftliche Verwertung"
      Guellegrube,
      kein_Abwasseranfall,
      !!@ comment = "Eine Klärgrube (1 Kammer) dient der Entwässerung einer Liegenschaft, die nicht an die öffentliche Kanalisation angeschlossen ist. Eine Klärgrube ist üblicherweise ein beckenartiges, unterirdisches Bauwerk, in dem sich die festen Stoffe am Boden absetzen, Klärgruben müssen periodisch geleert werden."
      Klaergrube,
      KLARA,
      unbekannt
    );
    Bezeichnung: MANDATORY TEXT*20;
    !!@ comment = "Setzt sich aus der Einwohnerzahl (E) und Einwohnergleichwerten (EGW) zusammen. Siehe VSA Leitfaden ALR Einwohnerwerte A03"
    Einwohnerwerte: EGW;
    !!@ comment = "Lage der Gebäudegruppe"
    Lage: Base_LV95.LKoord;
    !!@ comment = "OID der zugehörigen Entsorgung in der VSA-DSS, nur für Modelltransfers"
    OBJ_ID_Entsorgung: TEXT*16;
    !!@ comment = "OID des zugehörigen Entsorgung.AbwasserbauwerkRef in der VSA-DSS, nur für Modelltransfers"
    OBJ_ID_Entsorgung_Abwasserbauwerk: TEXT*16;
    !!@ comment = "OID des zugehörigen Entsorgung.EinleitstelleRef in der VSA-DSS, nur für Modelltransfers"
    OBJ_ID_Entsorgung_Einleitstelle: TEXT*16;
    !!@ comment = "OID des zugehörigen Entsorung.Versickerungsanlage in der VSA-DSS, nur für Modelltransfers"
    OBJ_ID_Entsorgung_Versickerungsanlage: TEXT*16;
    Sanierungsbedarf: (     
      ja,
      nein,
      unbekannt
    );
    Sanierungsdatum: INTERLIS_1_DATE;
    !!@ comment = "Kurzfassung des Konzepts gemäss Leistung Offerte (GEP Musterpflichtenheft)"
    Sanierungskonzept: MTEXT*255;
UNIQUE 
    !!@ comment = "UNIQUE Kombination Bezeichnung, DatenherrRef, damit mit VSA-DSS-Mini kompatibel (Wegleitung GEP-Daten 2014)"
    Bezeichnung, DatenherrRef;
END ALR;

!!@ comment = "Assoziation"
ASSOCIATION ALR_MassnahmeAssoc =
  MassnahmeRef  -- {0..1} Massnahme;
  ALR_MassnahmeAssocRef -- {0..*} ALR;
END ALR_MassnahmeAssoc;


!!@comment = "Ende des Topics / Fin du topic"
END VSADSSMini;
!!@comment = "Ende des Modells / Fin du modèle"
END VSADSSMINI_2020_LV95.

','2020-11-20 18:04:35.164');
INSERT INTO vsadssmini_arrow.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('SIA405_Base_Abwasser-20201103.ili','2.3','SIA405_Base_Abwasser_LV95{ Units INTERLIS Base_LV95}','!! SIA405_Base_Abwasser-20201103.ili 
!! Speziell für VSA-DSS Mini und VSA-DSS


INTERLIS 2.3;

 MODEL SIA405_Base_Abwasser_LV95 (de) AT "http://www.vsa.ch/models" 
  VERSION "03.11.2020" =

  !!@comment = "importiert INTERLIS 2 Basisunits"
  IMPORTS UNQUALIFIED INTERLIS;
  IMPORTS Units;
  IMPORTS Base_LV95;


!!@comment = "Copyright 2020 VSA"

!!@comment = "Aufbauend auf SIA405_Base ergänzt der VSA SIA405_Base als SIA405_Base_Abwasser mit der Klasse Organisation in einem eigenen Topic Administration, damit Organisationen als externen Datensatz aus dem Repository eingebunden werden können."

!!@comment = "Geprüft mit Commpiler Version 5.1.4 (2.10.2020)"
!!@comment = "Sachbearbeiter: Stefan Burckhardt"

!!@comment = "Sechste Version Variante SIA405_Base_Abwasser - in Bearbeitung"

!!@ comment = "20.11.2019 nur noch Version LV95"
!!@ comment = "1.8.2020 neu UNIQUE Bezeichnung, Organisationstyp;  !! Neben UNIQUE OBJ_ID zusätzlich auch Kombination Bezeichnung, Organisationstyp (Wegleitung GEP-Daten 2020)"
!!@ comment = "26.8.2020 SIA405_BaseClass.OBJ_ID gelöscht - keine Rückwärtskompatibilität mit INTERLIS 1 mehr notwendig und Redundanz zu OID (STANDARDOID)"
!!@ comment = "26.8.2020 Organisationstyp.Abwasserreinigungsanlage rausgenommen"
!!@ comment = "Abwasserreinigungsanlage (ARA) - unter Anlagenummer ARA Nummer erfassen"
!!@ comment = "26.8.2020 Anlagenummer: ARANr rausgenommen"
!!@comment = "ARA-Nummer gemäss Bundesamt für Umwelt (BAFU), bei Abwasserreinigungsanlage zwingend, sonst leer lassen"
!!@ comment = "8.9.2020 UNIQUE OBJ_ID rausgenommen"
!!@ comment = "8.9.2020 Abwasserreinigungsanlage bei Organisationstyp rausgenommen"
!!@ comment = "11.9.2020 UNIQUE Bezeichnung, Organisationstyp, UID statt Bezeichnung, Organisationstyp"
!!@ comment = "11.9.2020 neues Attribut Status [aktiv, untergegangen]"
!!@ comment = "8.10.2020     OrganisationBezeichnung = TEXT*255;  statt 80"
!!@ comment = "3.11.2020 Issuer geändert auf www.vsa.ch/models"

  UNIT

    KiloWatt [kW] = 1000 [Units.W];
    Liter_pro_Sekunde [ls] = (Units.L/s);
    Liter_pro_Tag [ld] = (Units.L/Units.d);
    Gramm_pro_Kubikmeter [gm3] = (Units.g/Units.m3);
    Kubikmeter_pro_Sekunde [m3s] = (Units.m3/s);
    Kubikmeter_pro_Tag [m3d] = (Units.m3/Units.d);
    Kubikmeter_pro_Stunde [m3h] = (Units.m3/Units.h);
    Meter_pro_Sekunde [ms] EXTENDS Units.Velocity = (m/s);
    Quadrat_Zentimeter [cm2] EXTENDS Units.Area = (Units.cm*Units.cm);

  DOMAIN

    !!@comment = "Allgemeine Typen fuer alle SIA405 Medien"

    !!@comment = "Abmessung Einheit Millimeter [mm], neu 21.2.2012"
    Abmessung = 0 .. 4000 [Units.mm];
    ARANr = 1 .. 999999 [Units.CountedObjects];
    !!@comment = "Breite Einheit Millimeter [mm]"
    Breite = 0 .. 4000 [Units.mm];    
    
    !!@comment = "Definiert die Lage- und Höhengenauigkeit eines Objektes. Falls ein Verlauf definiert ist, ist dieser immer [genau]."
    Genauigkeit = (   
                   !!@comment = "!! +/- 10 cm, bei der Lagebestimmung aus unterschiedlichen Messungen das dreifache, d.h. +/- 30 cm (Norm SIA405 2012)"
                   genau,  
                   unbekannt,
                   !!@comment = "siehe genau"
                   ungenau
                   );
    !!@comment = "Jahr: unbekannt = 1800 (niedrigster Wert des Wertebereiches)"
    Jahr = 1800 .. 2100;  
    !!@comment = "11.6.2012, neu positiv und negativ, Die Mächtigkeit ergibt sich aus der Differenz aus KoteRef und KoteZ und kann entweder einen negativen oder positiven Wert annehmen."
    Maechtigkeit  = -99999 .. 99999 [Units.mm]; 

    !!@comment ="als TEXT, da zum Teil auch Doppelwerte mit Schrägstrich, neu 21.2.2012"
    Nennweite = TEXT*10;

    !!@comment = "Neuer Datentyp für Eigentuemer, Betreiber, Datenherr, Datenlieferant, etc. Länge vorbereitet für Bezeichnung bei UID (www.uid.admin.ch). neu 21.2.2012"
    OrganisationBezeichnung = TEXT*255;  
    !!@comment = "Plantyp, für welchen die TextPos / SymbolPos definiert ist"
    Plantyp = (   
               Leitungskataster, 
               Werkplan, 
               Uebersichtsplan (
                  UeP10,  !! 1:10''000
                  UeP2,  !! 1:2''000
                  UeP5  !! 1:5''000
                  )
               );
    !!@comment = "Betriebs- und Planungszustand. neu 2010: Erweiterungen dazu in den einzelnen Medien definieren"
    Status= (   
             ausser_Betrieb,  
             in_Betrieb,
             tot,  
             unbekannt, 
             weitere 
            );
    !!@comment = "mittlerer Wert eines Objektes (Schutzrohr / Wasser / Fernwärme)"
    Ueberdeckung = 0.0 .. 999.9 [INTERLIS.m];   
    !!@comment = "Beispiel für UID: che123456789"
    UID = TEXT*12;  
    GemeindeNr = 1 .. 9999 [Units.CountedObjects];  


   !!@comment = "SIA405_BaseClass für alle Oberklassen (Superclass) mit Metaattributen"
   CLASS SIA405_BaseClass (ABSTRACT) EXTENDS Base_LV95.BaseClass =
      !!@comment STANDARDOID ist gewählte Option für Definition ANYOID aus base.ili. Weitere Infos siehe Merkblatt 2015, Kapitel 2.1.3.8 Objektidentifikatoren (OID). OBJ_ID wird nicht mehr redundant modelliert und wurde aufgehoben. 
      OID AS STANDARDOID;
      ATTRIBUTE
        !!@comment = "Letzte Aenderung des Datensatzes, andere Metaattribute neu als Beziehung"
        Letzte_Aenderung: MANDATORY INTERLIS.INTERLIS_1_DATE; 
   END SIA405_BaseClass;  
 
   CLASS SIA405_TextPos (ABSTRACT) EXTENDS Base_LV95.TextPos =
      !!@comment = "OID auch bei SIA405_TextPost neu 27.11.2019"
      OID AS STANDARDOID;
      Plantyp: MANDATORY Plantyp;
      !!@comment = "aus Attributen berechneter Wert, MTEXT damit auch mehrzeilig möglich"
      Textinhalt: MANDATORY MTEXT; 
      !!@comment = "für bilaterale weitere Spezifikationen"
      Bemerkung: TEXT*80; 
   END SIA405_TextPos; 

   CLASS SIA405_SymbolPos (ABSTRACT) EXTENDS Base_LV95.SymbolPos =
      !!@comment = "neu OID auch für SIA405_SymbolPos 27.11.2019"
      OID AS STANDARDOID;
      Plantyp: MANDATORY Plantyp;
      SymbolskalierungLaengs: 0.0 .. 9.9;
      SymbolskalierungHoch: 0.0 .. 9.9;
   END SIA405_SymbolPos; 
   
   TOPIC Administration = 
   
   CLASS Organisation EXTENDS SIA405_BaseClass = 
      ATTRIBUTE
        !!@ comment = "Allgemeine Bemerkungen"
        Bemerkung: TEXT*255;
		!!@ comment = "Es wird empfohlen reale Namen zu nehmen, z.B. Mustergemeinde und nicht Gemeinde. Oder Abwasserverband ARA Muster und nicht nur Abwasserverband, da es sonst Probleme gibt bei der Zusammenführung der Daten."
        Bezeichnung: MANDATORY SIA405_Base_Abwasser_LV95.OrganisationBezeichnung;
        !!@ comment = "Offizielle Gemeinde Nummer gemäss Bundesamt für Statistik, bei Gemeinde zwingend, sonst leer lassen."
        Gemeindenummer: GemeindeNr;
        !!@ comment = "Kurzbezeichnung"
        Kurzbezeichnung: TEXT*12;
		Organisationstyp: MANDATORY (
          !!@ comment = "Abwasserverband"
          Abwasserverband,
          !!@ comment = "Teil einer Bundesverwaltung (z.B. Bundesamt für Umwelt, ASTRA, Armasuisse)"
          Bund,
          !!@ comment = "Für die Belange der Siedlungsentwässerung zuständiges Organ der Gemeindeverwaltung"
          Gemeinde,
          !!@ comment = "Genossenschaft oder Korporation: Körperschaft öffentlichen Rechts. Falls privaten Rechtes dann als Privat abbilden."
          Genossenschaft_Korporation,
          !!@ comment = "Teil einer kantonalen Verwaltung (z.B. Amt für Umweltschutz, Amt für Abwasserentsorgung)"
          Kanton,
          !!@ comment = "Privatperson oder Privatorganisation, welche im Rahmen der Entwässerungsplanung auftritt"
          Privat
        );
        !!@ comment = "Status der Organisation, damit untergegangende Organisationen nicht einfach gelöscht werden müssen und kontrolliert werden kann, ob noch Beziehungen auf untergegangene Organisationen, z.B. bei Gemeindefusion oder Konkurs einer Firma vorhanden sind"
        Status: MANDATORY (
          aktiv,
          untergegangen
        );
        !!@ comment = "Referenz zur Unternehmensidentifikation des Bundesamts fuer Statistik (www.uid.admin.ch), z.B. CHE123456789"
        UID: UID;
    UNIQUE 
		!!@comment = "!! Neben UNIQUE OID zusätzlich auch Kombination Bezeichnung, Organisationstyp, UID (Wegleitung GEP-Daten 2020)"
        Bezeichnung, Organisationstyp, UID; 
    END Organisation;

END Administration;

END SIA405_Base_Abwasser_LV95.
','2020-11-20 18:04:35.164');
INSERT INTO vsadssmini_arrow.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('Units-20120220.ili','2.3','Units','!! File Units.ili Release 2012-02-20

INTERLIS 2.3;

!! 2012-02-20 definition of "Bar [bar]" corrected
!!@precursorVersion = 2005-06-06

CONTRACTED TYPE MODEL Units (en) AT "http://www.interlis.ch/models"
  VERSION "2012-02-20" =

  UNIT
    !! abstract Units
    Area (ABSTRACT) = (INTERLIS.LENGTH*INTERLIS.LENGTH);
    Volume (ABSTRACT) = (INTERLIS.LENGTH*INTERLIS.LENGTH*INTERLIS.LENGTH);
    Velocity (ABSTRACT) = (INTERLIS.LENGTH/INTERLIS.TIME);
    Acceleration (ABSTRACT) = (Velocity/INTERLIS.TIME);
    Force (ABSTRACT) = (INTERLIS.MASS*INTERLIS.LENGTH/INTERLIS.TIME/INTERLIS.TIME);
    Pressure (ABSTRACT) = (Force/Area);
    Energy (ABSTRACT) = (Force*INTERLIS.LENGTH);
    Power (ABSTRACT) = (Energy/INTERLIS.TIME);
    Electric_Potential (ABSTRACT) = (Power/INTERLIS.ELECTRIC_CURRENT);
    Frequency (ABSTRACT) = (INTERLIS.DIMENSIONLESS/INTERLIS.TIME);

    Millimeter [mm] = 0.001 [INTERLIS.m];
    Centimeter [cm] = 0.01 [INTERLIS.m];
    Decimeter [dm] = 0.1 [INTERLIS.m];
    Kilometer [km] = 1000 [INTERLIS.m];

    Square_Meter [m2] EXTENDS Area = (INTERLIS.m*INTERLIS.m);
    Cubic_Meter [m3] EXTENDS Volume = (INTERLIS.m*INTERLIS.m*INTERLIS.m);

    Minute [min] = 60 [INTERLIS.s];
    Hour [h] = 60 [min];
    Day [d] = 24 [h];

    Kilometer_per_Hour [kmh] EXTENDS Velocity = (km/h);
    Meter_per_Second [ms] = 3.6 [kmh];
    Newton [N] EXTENDS Force = (INTERLIS.kg*INTERLIS.m/INTERLIS.s/INTERLIS.s);
    Pascal [Pa] EXTENDS Pressure = (N/m2);
    Joule [J] EXTENDS Energy = (N*INTERLIS.m);
    Watt [W] EXTENDS Power = (J/INTERLIS.s);
    Volt [V] EXTENDS Electric_Potential = (W/INTERLIS.A);

    Inch [in] = 2.54 [cm];
    Foot [ft] = 0.3048 [INTERLIS.m];
    Mile [mi] = 1.609344 [km];

    Are [a] = 100 [m2];
    Hectare [ha] = 100 [a];
    Square_Kilometer [km2] = 100 [ha];
    Acre [acre] = 4046.873 [m2];

    Liter [L] = 1 / 1000 [m3];
    US_Gallon [USgal] = 3.785412 [L];

    Angle_Degree = 180 / PI [INTERLIS.rad];
    Angle_Minute = 1 / 60 [Angle_Degree];
    Angle_Second = 1 / 60 [Angle_Minute];

    Gon = 200 / PI [INTERLIS.rad];

    Gram [g] = 1 / 1000 [INTERLIS.kg];
    Ton [t] = 1000 [INTERLIS.kg];
    Pound [lb] = 0.4535924 [INTERLIS.kg];

    Calorie [cal] = 4.1868 [J];
    Kilowatt_Hour [kWh] = 0.36E7 [J];

    Horsepower = 746 [W];

    Techn_Atmosphere [at] = 98066.5 [Pa];
    Atmosphere [atm] = 101325 [Pa];
    Bar [bar] = 100000 [Pa];
    Millimeter_Mercury [mmHg] = 133.3224 [Pa];
    Torr = 133.3224 [Pa]; !! Torr = [mmHg]

    Decibel [dB] = FUNCTION // 10**(dB/20) * 0.00002 // [Pa];

    Degree_Celsius [oC] = FUNCTION // oC+273.15 // [INTERLIS.K];
    Degree_Fahrenheit [oF] = FUNCTION // (oF+459.67)/1.8 // [INTERLIS.K];

    CountedObjects EXTENDS INTERLIS.DIMENSIONLESS;

    Hertz [Hz] EXTENDS Frequency = (CountedObjects/INTERLIS.s);
    KiloHertz [KHz] = 1000 [Hz];
    MegaHertz [MHz] = 1000 [KHz];

    Percent = 0.01 [CountedObjects];
    Permille = 0.001 [CountedObjects];

    !! ISO 4217 Currency Abbreviation
    USDollar [USD] EXTENDS INTERLIS.MONEY;
    Euro [EUR] EXTENDS INTERLIS.MONEY;
    SwissFrancs [CHF] EXTENDS INTERLIS.MONEY;

END Units.

','2020-11-20 18:04:35.164');
INSERT INTO vsadssmini_arrow.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('Base_d-20181005.ili','2.3','Base{ Units INTERLIS} Base_LV95{ Units INTERLIS}','!! Base_d-20180410.ili
!! 10.4.2018 Neu auch mit Base_LV95 in der gleichen Datei

INTERLIS 2.3;

TYPE MODEL Base (de) AT "http://www.sia.ch/405" 
  VERSION "05.10.2018" =

    IMPORTS UNQUALIFIED INTERLIS;		!! neu 8.11.2004, importiert INTERLIS 2.3. Basisunits
    IMPORTS Units;
  !! IMPORTS CoordSys;
  !! REFSYSTEM BASKET BCoordSys ~ CoordSys.CoordsysTopic; 

!! Copyright 2003 - 2018 SIA

!! Änderungen und Ergänzungen dürfen zum Eigengebrauch getätigt werden. 
!! Sie müssen innerhalb der Datei so dokumentiert sein, dass sichtbar wird, 
!! welche Änderungen getätigt wurden (Einfügen von INTERLIS Kommentar). 
!! Die Originalmodelldatei Base.ili und darauf basierende 
!! abgeänderte Versionen dürfen nicht weiterverkauft werden. 

!! Geprueft mit Compiler Version 4.7.7 vom 08.02.2018
!! Sachbearbeiter: Stefan Burckhardt / SIA 405 Kommission  
  
!! 18.4.2014 Korrektur Wertebereich für LKKoord / HKoord für Bezugsrahmen LV95 (1070000.000 statt 170000.000 .. 1300000.000)
  
  DOMAIN
    !! Allgemeine Typen fuer alle Modelle

    Orientierung = 0.0 .. 359.9 CIRCULAR [Units.Angle_Degree];  !! Anpassen auf Geobasisdatendefinition?

    LKoord = COORD 480000.000 .. 840000.000 [m], !!{CHLV03/1}, 
                   70000.000 .. 300000.000 [m],  !!{CHLV03/2},
                   ROTATION 2 -> 1;

    HKoord = COORD 480000.000 .. 840000.000 [m], !!{CHLV03/1},
                   70000.000 .. 300000.000 [m], !!{CHLV03/2}, 
                   -200.000 .. 5000.000 [m], !!{SwissOrthometricAlt},
                   ROTATION 2 -> 1;

!! 10.4.2018 falls Bezugsrahmen LV95 untenstehende Version Base_LV95 verwenden)


    Hoehe = -200.000 .. 5000.000 [m]; !!{SwissOrthometricAlt};

    Polyline = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX LKoord;

!! neu 23.5.2012	
!!    Surface = SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord WITHOUT OVERLAPS > 0.000;  !! Einzelflächen
	Surface = SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord WITHOUT OVERLAPS > 0.050;  !! Einzelflächen

!! neu 2.8.2011
    Polyline3D = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX HKoord;
	
!! neu 23.5.2012
!!    Surface3D = SURFACE WITH (STRAIGHTS, ARCS) VERTEX HKoord WITHOUT OVERLAPS > 0.000;
    Surface3D = SURFACE WITH (STRAIGHTS, ARCS) VERTEX HKoord WITHOUT OVERLAPS > 0.050;

!! neu 25.1.2012
   CLASS BaseClass (ABSTRACT) =
   !! BaseClass für alle Subklassen (Subclass - Vererbung)

   END BaseClass;  

!! neu 4.8.2011 / 21.2.2012 (geerbt von BaseClass)
   CLASS TextPos (ABSTRACT) EXTENDS BaseClass =
!!      OID AS ANYOID; !! Hier definiert als ANY. Genaue Definition und Wahl durch die Transfergemeinschaft gemäss folgenden Varianten: Objektidentifikation gemäss INTERLIS 2 Definition für OID (entweder als UUIDOID nach ISO 11578 oder INTERLIS 2 STANDARDOID), siehe auch INTERLIS 2 Referenzhandbuch www.interlis.ch
      TextPos: MANDATORY LKoord; 
      TextOri: MANDATORY Orientierung;
      TextHAli: MANDATORY HALIGNMENT;
      TextVAli: MANDATORY VALIGNMENT;
   END TextPos; 

!! neu 30.8.2011 / 21.2.2012 (geerbt von BaseClass)
   CLASS SymbolPos (ABSTRACT) EXTENDS BaseClass =
!!      OID AS ANYOID; !! Hier definiert als ANY. Genaue Definition und Wahl durch die Transfergemeindschaft gemäss folgenden Varianten: Objektidentifikation gemäss INTERLIS 2 Definition für OID (entweder als INTERLIS 2 STANDARD-OID oder UUID-OID nach ISO 11578), siehe auch INTERLIS 2 Referenzhandbuch www.interlis.ch
      SymbolPos: MANDATORY LKoord;  !! Landeskoordinate Ost/Nord, 2D Koordinaten 
      SymbolOri: MANDATORY Orientierung;  !! Default: 90 Grad
!! 21.2.2012 verschoben in SIA405_Base.ili
!!      SymbolskalierungLaengs: 0.0..9.9;
!!      SymbolskalierungHoch: 0.0..9.9;
   END SymbolPos; 

END Base.




TYPE MODEL Base_LV95 (de) AT "http://www.sia.ch/405" 
  VERSION "05.10.2018" =

    IMPORTS UNQUALIFIED INTERLIS;		!! neu 8.11.2004, importiert INTERLIS 2.3. Basisunits
    IMPORTS Units;
  !! IMPORTS CoordSys;
  !! REFSYSTEM BASKET BCoordSys ~ CoordSys.CoordsysTopic; 

!! Copyright 2003 - 2018 SIA

!! Änderungen und Ergänzungen dürfen zum Eigengebrauch getätigt werden. 
!! Sie müssen innerhalb der Datei so dokumentiert sein, dass sichtbar wird, 
!! welche Änderungen getätigt wurden (Einfügen von INTERLIS Kommentar). 
!! Die Originalmodelldatei Base.ili und darauf basierende 
!! abgeänderte Versionen dürfen nicht weiterverkauft werden. 

!! Geprueft mit Compiler Version 4.7.7 vom 08.02.2018
!! Sachbearbeiter: Stefan Burckhardt / SIA 405 Kommission  
  
!! 18.4.2014 Korrektur Wertebereich für LKKoord / HKoord für Bezugsrahmen LV95 (1070000.000 statt 170000.000 .. 1300000.000)
  
  DOMAIN
    !! Allgemeine Typen fuer alle Modelle

    Orientierung = 0.0 .. 359.9 CIRCULAR [Units.Angle_Degree];  !! Anpassen auf Geobasisdatendefinition?


!! für Bezugsrahmen LV95 folgende Definition verwenden 
!! 18.4.2014
    LKoord = COORD 2480000.000 .. 2840000.000 [m], !!{CHLV95/1}, 
                   1070000.000 .. 1300000.000 [m],  !!{CHLV95/2},
                   ROTATION 2 -> 1;
 
    HKoord = COORD 2480000.000 .. 2840000.000 [m], !!{CHL95/1},
                   1070000.000 .. 1300000.000 [m], !!{CHLV95/2}, 
                   -200.000 .. 5000.000 [m], !!{SwissOrthometricAlt},
                   ROTATION 2 -> 1;

    Hoehe = -200.000 .. 5000.000 [m]; !!{SwissOrthometricAlt};

    Polyline = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX LKoord;

!! neu 23.5.2012	
!!    Surface = SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord WITHOUT OVERLAPS > 0.000;  !! Einzelflächen
	Surface = SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord WITHOUT OVERLAPS > 0.050;  !! Einzelflächen

!! neu 2.8.2011
    Polyline3D = POLYLINE WITH (STRAIGHTS, ARCS) VERTEX HKoord;
	
!! neu 23.5.2012
!!    Surface3D = SURFACE WITH (STRAIGHTS, ARCS) VERTEX HKoord WITHOUT OVERLAPS > 0.000;
    Surface3D = SURFACE WITH (STRAIGHTS, ARCS) VERTEX HKoord WITHOUT OVERLAPS > 0.050;

!! neu 25.1.2012
   CLASS BaseClass (ABSTRACT) =
   !! BaseClass für alle Subklassen (Subclass - Vererbung)

   END BaseClass;  

!! neu 4.8.2011 / 21.2.2012 (geerbt von BaseClass)
   CLASS TextPos (ABSTRACT) EXTENDS BaseClass =
!!      OID AS ANYOID; !! Hier definiert als ANY. Genaue Definition und Wahl durch die Transfergemeinschaft gemäss folgenden Varianten: Objektidentifikation gemäss INTERLIS 2 Definition für OID (entweder als UUIDOID nach ISO 11578 oder INTERLIS 2 STANDARDOID), siehe auch INTERLIS 2 Referenzhandbuch www.interlis.ch
      TextPos: MANDATORY LKoord; 
      TextOri: MANDATORY Orientierung;
      TextHAli: MANDATORY HALIGNMENT;
      TextVAli: MANDATORY VALIGNMENT;
   END TextPos; 

!! neu 30.8.2011 / 21.2.2012 (geerbt von BaseClass)
   CLASS SymbolPos (ABSTRACT) EXTENDS BaseClass =
!!      OID AS ANYOID; !! Hier definiert als ANY. Genaue Definition und Wahl durch die Transfergemeindschaft gemäss folgenden Varianten: Objektidentifikation gemäss INTERLIS 2 Definition für OID (entweder als INTERLIS 2 STANDARD-OID oder UUID-OID nach ISO 11578), siehe auch INTERLIS 2 Referenzhandbuch www.interlis.ch
      SymbolPos: MANDATORY LKoord;  !! Landeskoordinate Ost/Nord, 2D Koordinaten 
      SymbolOri: MANDATORY Orientierung;  !! Default: 90 Grad
!! 21.2.2012 verschoben in SIA405_Base.ili
!!      SymbolskalierungLaengs: 0.0..9.9;
!!      SymbolskalierungHoch: 0.0..9.9;
   END SymbolPos; 

END Base_LV95.','2020-11-20 18:04:35.164');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.SqlNull','enable');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.beautifyEnumDispName','underscore');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.interlis.ili2c.ilidirs','https://vsa.ch/models;http://models.geo.admin.ch');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.arrayTrafo','coalesce');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.nameOptimization','topic');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.localisedTrafo','expand');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.jsonTrafo','coalesce');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.numericCheckConstraints','create');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.sender','ili2pg-4.4.2-7b1d50437cd6970a801b16d177c4e27151414569');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.sqlgen.createGeomIndex','True');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsAuthority','EPSG');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsCode','2056');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createEnumDefs','multiTable');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uniqueConstraints','create');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.maxSqlNameLength','60');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uuidDefaultValue','uuid_generate_v4()');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.inheritanceTrafo','smart1');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.catalogueRefTrafo','coalesce');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiPointTrafo','coalesce');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.StrokeArcs','enable');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO vsadssmini_arrow.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multilingualTrafo','expand');
