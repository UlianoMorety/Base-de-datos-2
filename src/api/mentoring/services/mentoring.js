'use strict';

/**
 * mentoring service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::mentoring.mentoring');
