<!-- search -->
<div class="well">
    <div class="row">
        <form class="form-horizontal" role="form" method="post" action="<?php _e(BASE_URL . 'search/'); ?>">
            <div class="col-md-8">
                	<input type="hidden" name="<?php _e($csrf_key); ?>" value="<?php _e($csrf_token); ?>">
                    <input type="text" class="form-control input-lg" name="terms" placeholder="<?php echo $lang->t('search|search_for'); ?>">
            </div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-info btn-lg btn-block"><?php echo $lang->t('search|search'); ?></button>
            </div>
        </form>
    </div>
</div>