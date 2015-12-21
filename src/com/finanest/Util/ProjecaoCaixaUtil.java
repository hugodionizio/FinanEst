package com.finanest.Util;

import java.awt.BasicStroke;
import java.awt.Color;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

import com.finanest.DAO.CaixaDAO;
import com.finanest.DAO.ContatoDAO;
import com.finanest.annotations.Caixa;
import com.finanest.annotations.Contato;

import de.laures.cewolf.ChartPostProcessor;
import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.CategoryItemLinkGenerator;
import de.laures.cewolf.tooltips.CategoryToolTipGenerator;

/**
 * An example data producer.
 * 
 * @author Guido Laures
 */
@ManagedBean(name="ProjecaoCaixa", eager = true)
@RequestScoped
public class ProjecaoCaixaUtil implements DatasetProducer,
		CategoryToolTipGenerator, CategoryItemLinkGenerator,
		ChartPostProcessor, Serializable {

	private static final Log log = LogFactory.getLog(ProjecaoCaixaUtil.class);

	// These values would normally not be hard coded but produced by
	// some kind of data source like a database or a file
	private final String[] categories = { "Jan", "Fev", "Mar", "Abr", "Mai", "Jun",
			"Jul", "Ago", "Set", "Out", "Nov", "Dez" };
	private final String[] seriesNames = { "Entradas", "Saídas",
			"Saldo"};

	/**
	 * Produces some random data.
	 */
	public Object produceDataset(Map params) throws DatasetProduceException {
		log.debug("producing data.");

		// Invocando JFreeChart
		DefaultCategoryDataset dataset = new DefaultCategoryDataset() {
			/**
			 * @see java.lang.Object#finalize()
			 */
			protected void finalize() throws Throwable {
				super.finalize();
				log.debug(this + " finalized.");
			}
		};
		
		int numCategorias = categories.length;
		int intermediarias;
		if (numCategorias >= 12)
			intermediarias = (int)(numCategorias/12);
		else
			intermediarias = 1;
		
		@SuppressWarnings("unchecked")
		List<Caixa> caixa = (new CaixaDAO()).listar();
		
		// Curva das Entradas
		for (Caixa registro : caixa) {
			dataset.addValue(registro.getEntrada(), seriesNames[0], registro.getData());
		}		
		
		// Curva das Saídas
		for (Caixa registro : caixa) {
			dataset.addValue(registro.getSaida(), seriesNames[1], registro.getData());
		}
		
		// Curva do Saldo
		for (Caixa registro : caixa) {
			dataset.addValue(registro.getSaldo(), seriesNames[2], registro.getData());
		}		
		
		return dataset;
	}

	/**
	 * This producer's data is invalidated after 5 seconds. By this method the
	 * producer can influence Cewolf's caching behaviour the way it wants to.
	 */
	public boolean hasExpired(Map params, Date since) {
		log.debug(getClass().getName() + "hasExpired()");
		return (System.currentTimeMillis() - since.getTime()) > 5000;
	}

	/**
	 * Returns a unique ID for this DatasetProducer
	 */
	public String getProducerId() {
		return "ProjecaoCaixaUtil DatasetProducer";
	}

	/**
	 * Returns a link target for a special data item.
	 */
	public String generateLink(Object data, int series, Object category) {
		return seriesNames[series];
	}

	/**
	 * @see java.lang.Object#finalize()
	 */
	protected void finalize() throws Throwable {
		super.finalize();
		log.debug(this + " finalized.");
	}

	/**
	 * @see org.jfree.chart.tooltips.CategoryToolTipGenerator#generateToolTip(CategoryDataset,
	 *      int, int)
	 */
	public String generateToolTip(CategoryDataset arg0, int series, int arg2) {
		return seriesNames[series];
	}

	@Override
	public void processChart(JFreeChart arg0, Map<String, String> arg1) {
		// TODO Auto-generated method stub
		// arg0 será o parametro criado no process chart
		// Ex: public void processChart(Object arg0, Map arg1)
		JFreeChart chart = (JFreeChart) arg0;
		
		//Capturar o plot  
        CategoryPlot categoryPlot = chart.getCategoryPlot();

      //Criar o objeto de renderer que irá permitir alterar as cores das linhas, espessura, etc  
        CategoryItemRenderer renderer = categoryPlot.getRenderer();
        
		//LineAndShapeRenderer renderer = new LineAndShapeRenderer();

		// sets thickness for series (using strokes)
        for (int i = 0; i < seriesNames.length; i++) {
    		renderer.setSeriesStroke(i, new BasicStroke(3.0f));
		}
        
        renderer.setSeriesPaint(0, Color.BLUE);
        renderer.setSeriesPaint(1, Color.RED);
        renderer.setSeriesPaint(2, Color.GREEN);
        
  //      CategoryAxis domainAxis = categoryPlot.getDomainAxis();
 //       domainAxis.setTickLabelPaint("Intermediária", Color.white);
        
/*        CategoryPlot plot = (CategoryPlot) chart.getPlot();
        CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setTickLabelPaint("Category 2", Color.white);
        domainAxis.setTickLabelPaint("Category 4", Color.white);
*/	}

}