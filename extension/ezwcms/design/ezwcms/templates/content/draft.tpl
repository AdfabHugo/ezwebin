<div class="box-mc">
<div class="tl"><div class="tr"><div class="br"><div class="bl"><div class="box-content float-break">

<div class="content-draft">
<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
<!--
{literal}
function checkAll()
{
{/literal}
    if ( document.draftaction.selectall.value == "{'Select all'|i18n('design/standard/content/view')}" )
{literal}
    {
{/literal}
        document.draftaction.selectall.value = "{'Deselect all'|i18n('design/standard/content/view')}";
{literal}
        with (document.draftaction) 
	{
            for (var i=0; i < elements.length; i++) 
	    {
                if (elements[i].type == 'checkbox' && elements[i].name == 'DeleteIDArray[]')
                     elements[i].checked = true;
	    }
        }
     }
     else
     {
{/literal}
         document.draftaction.selectall.value = "{'Select all'|i18n('design/standard/content/view')}";
{literal}
         with (document.draftaction) 
	 {
            for (var i=0; i < elements.length; i++) 
	    {
                if (elements[i].type == 'checkbox' && elements[i].name == 'DeleteIDArray[]')
                     elements[i].checked = false;
	    }
         }
     }
}
{/literal}
//-->
</SCRIPT>
{let page_limit=30
     list_count=fetch('content','draft_count')}

<form name="draftaction" action={concat("content/draft/")|ezurl} method="post" >

<div class="attribute-header">
	<h1>{"My drafts"|i18n("design/standard/content/view")}</h1>
</div>

{let draft_list=fetch('content','draft_version_list',hash(limit,$page_limit,offset,$view_parameters.offset))}

{section show=$draft_list}

<div class="buttonblock">
<input class="button" type="submit" name="EmptyButton" value="{'Empty Draft'|i18n('design/standard/content/view')}" />
</div>

<p>
    {"These are the current objects you are working on. The drafts are owned by you and can only be seen by you.
      You can either edit the drafts or remove them if you don't need them any more."|i18n("design/standard/content/view")|nl2br}
</p>

<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <th></th>
    <th>{"Name"|i18n("design/standard/content/view")}</th>
    <th>{"Class"|i18n("design/standard/content/view")}</th>
    <th>{"Section"|i18n("design/standard/content/view")}</th>
    <th>{"Version"|i18n("design/standard/content/view")}</th>
    <th>{"Language"|i18n("design/standard/content/view")}</th>
    <th>{"Last modified"|i18n("design/standard/content/view")}</th>
    <th>{"Edit"|i18n("design/standard/content/view")}</th>
</tr>

{section name=Draft loop=$draft_list sequence=array(bglight,bgdark)}
<tr class="{$Draft:sequence}">
    <td align="left" width="1">
        <input type="checkbox" name="DeleteIDArray[]" value="{$Draft:item.id}" />
    </td>
    <td>
        <a href={concat("/content/versionview/",$Draft:item.contentobject.id,"/",$Draft:item.version,"/")|ezurl}>{$Draft:item.version_name|wash}</a>
    </td>
    <td>
        {$Draft:item.contentobject.content_class.name|wash}
    </td>
    <td>
        {$Draft:item.contentobject.section_id}
    </td>
    <td>
        {$Draft:item.version}
    </td>
    <td>
        {$Draft:item.initial_language.name|wash}
    </td>
    <td>
        {$:item.modified|l10n(datetime)}
    </td>
    <td width="1">
        <a href={concat("/content/edit/",$Draft:item.contentobject.id,"/",$Draft:item.version,"/")|ezurl}><img src={"edit.gif"|ezimage} border="0" alt="Edit" /></a>
    </td>
</tr>
{/section}
<tr class="bgdark">
    <td colspan="1" align="left" width="1">
        <input type="image" name="RemoveButton" value="{'Remove'|i18n('design/standard/content/view')}" src={"trash.png"|ezimage} />
    </td>
    <td colspan="7">
    </td>
</tr>
</table>
<input class="button" name="selectall" onclick=checkAll() type="button" value="{'Select all'|i18n('design/standard/content/view')}" />
{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri='/content/draft'
         item_count=$list_count
         view_parameters=$view_parameters
         item_limit=$page_limit}

{section-else}

<div class="feedback">
<h2>{"You have no drafts"|i18n("design/standard/content/view")}</h2>
</div>

{/section}

</form>
</div>

</div></div></div></div></div>
</div>