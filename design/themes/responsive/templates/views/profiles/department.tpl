
<div id="product_features_{$block.block_id}">
    <div class="ty-feature">
        {if $department_data.main_pair}
        <div class="ty-feature__image">
            {include file="common/image.tpl" images=$department_data.main_pair}
        </div>
        {/if}

        <div class="ty-feature__description ty-wysiwyg-content">
            {$department_data.description nofilter}
        </div>

        {if $department_data.users}
            <div class="ty-feature__description ty-wysiwyg-content">
                {foreach from=$department_data.users item="department"}
                    {$department}
                {/foreach}
            </div>
        {/if}
</div>


<!--product_features_{$block.block_id}--></div>
{capture name="mainbox_title"}{$variant_data.variant nofilter}{/capture}